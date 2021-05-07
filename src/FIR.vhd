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

shared variable RAM_Left : ram_type;
shared variable RAM_Right : ram_type;

signal current_data : std_logic_vector(23 downto 0);
signal old_data : std_logic_vector(23 downto 0);
--signal counter : std_logic_vector(9 downto 0);
signal accumulator : std_logic_vector(66 downto 0);

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
                ----------------------
                -------MAC HERE-------
                ----------------------
                ena <= '1';
                wea <= '0';
                FOR i IN 0 TO 1023 LOOP
                    addra <= i;
                    accumulator := accumulator + products(i);                                  
                END LOOP;
                --if (counter = x"3FF") then
                --    state <= Output;
                --end if;
                --counter <= counter + '1';

            when Output =>
                S_AXIS_TREADY <= '0';
                M_AXIS_TVALID <= '1';
                if (M_AXIS_TREADY = '1') then
                    M_AXIS_TDATA <= SOMETHING; --HERE--
                    state <= Idle;
                end if;
            end case;
        end if;
    end process FIR;

    process(clk)
        begin
        current_data <= S_AXIS_TDATA(27 downto 4);
        if clk'event and clk = '1' then
            if not(current_data and old_data) then
                RAM(conv_integer(addra)) := dia;
            end if;
        end if;
        old_data <= current_data;
    end process;

    process(clk)
        begin
        if clk'event and clk = '1' then
            if enb = '1' then
                sampling <= RAM(conv_integer(addrb));
            end if;
        end if;
    end process;

end architecture RTL;