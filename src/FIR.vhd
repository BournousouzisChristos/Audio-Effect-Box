library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIR_Filter is
port (
  ACLK	: in std_logic;
  --AXIS IN
  SRESETN	: in std_logic;
  S_AXIS_TREADY	: out std_logic;
  S_AXIS_TDATA	: in std_logic_vector(31 downto 0);
  S_AXIS_TVALID	: in std_logic;
  --AXIS OUT
  M_AXIS_TVALID	: out std_logic;
  M_AXIS_TDATA	: out std_logic_vector(31 downto 0);
  M_AXIS_TREADY	: in std_logic;
  --RAM
  ena : out std_logic;
  wea : out std_logic;     
  addra : out std_logic_vector(9 downto 0);
  coeff : in std_logic_vector(31 downto 0));
end FIR_Filter;

architecture RTL of FIR_Filter is

type FIR is (Idle, Filter, Output);
signal state : FIR := Idle;

type ram_type is array (1023 downto 0) of std_logic_vector(24 downto 0);
type buffer is array (1023 downto 0) of std_logic_vector(32 downto 0);

shared variable RAM_Left : ram_type;
shared variable RAM_Right : ram_type;

shared variable Circular_Buffer : buffer;

signal current_data : std_logic_vector(23 downto 0);
signal old_data : std_logic_vector(23 downto 0);
signal accumulator : std_logic_vector(66 downto 0);
signal counter : std_logic_vector(9 downto 0);

signal data_out : std_logic_vector(31 downto 0);
signal parity_calc : STD_LOGIC_VECTOR(30 downto 0);

begin
    FIR : process(ACLK)
        begin
        if (SRESETN = '0') then
            state <= Idle;
        else
            case state is 
            when Idle =>
                S_AXIS_TREADY <= '1';
                M_AXIS_TVALID <= '0';
                if (S_AXIS_TVALID = '1') then
                    state <= Filter;
                end if;

            when Filter =>
                S_AXIS_TREADY <= '0';
                ena <= '1';
                wea <= '0';
                FOR i IN 0 TO 1023 LOOP
                    addra <= i;
                    sample <= RAM_Left(conv_integer(i));
                    accumulator := accumulator + (coeff * sample);                                  
                END LOOP;
                
            when Output =>
                S_AXIS_TREADY <= '0';
                M_AXIS_TVALID <= '1';
                if (M_AXIS_TREADY = '1') then
                    data_out(27 downto 4) <= SOMETHING;
                    parity_calc(0) <= '0';              
                    parity_logic: FOR i IN 0 to 30 GENERATE
                        parity_calc(i+1) <= parity_calc(i) XOR data_out(i);
                    END GENERATE;
                    data_out(31) <= parity_calc(30); 
                    M_AXIS_TDATA <= data_out;
                    state <= Idle;
                end if;

            end case;
        end if;
    end process FIR;

    process(ACLK)
        begin
        current_data <= S_AXIS_TDATA(27 downto 4);
        if clk'event and clk = '1' then
            if not(current_data and old_data) then
                if S_AXIS_TDATA(30) = '1' then
                    RAM_Left(conv_integer(counter)) := current_data;
                else
                    RAM_Right(conv_integer(counter)) := current_data;
                end if;
            end if;
        end if;
        old_data <= current_data;
        counter <= counter + '1';
        if counter = x"400" then
            counter <= "0";
        end if;
    end process;

end architecture RTL;