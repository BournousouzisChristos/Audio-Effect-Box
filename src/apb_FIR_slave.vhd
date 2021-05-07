library ieee;
use     ieee.std_logic_1164.all;

entity apb_slave is

port(

    -- Clocks
    axi_aclk                     :in  std_logic;
    axi_arst_n                   :in  std_logic;    

    -- Peripheral Servant Port: from ZYNQ Master Port       
    -- (Connect to ZYNQ M_AXI_GPO -> axi-interconnect -> axi-apb-bridge)
    s_apb_gp0_paddr              :in  std_logic_vector(31 downto 0);   
    s_apb_gp0_psel               :in  std_logic;                       
    s_apb_gp0_penable            :in  std_logic;                       
    s_apb_gp0_pwrite             :in  std_logic;                       
    s_apb_gp0_pwdata             :in  std_logic_vector(31 downto 0);   
    s_apb_gp0_pready             :out std_logic;                       
    s_apb_gp0_prdata             :out std_logic_vector(31 downto 0);   
    s_apb_gp0_pslverr            :out std_logic;
    enb                          :out std_logic;
    web                          :out std_logic;     
    addrb                        :out std_logic_vector(9 downto 0);
    dib                          :out std_logic_vector(31 downto 0)
);

ATTRIBUTE X_INTERFACE_INFO                       :STRING;


end entity;

architecture rtl of apb_slave is

ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_paddr    :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PADDR";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_psel     :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PSEL";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_penable  :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PENABLE";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_pwrite   :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PWRITE";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_pwdata   :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PWDATA";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_pready   :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PREADY";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_prdata   :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PRDATA";
ATTRIBUTE X_INTERFACE_INFO of s_apb_gp0_pslverr  :SIGNAL is "xilinx.com:interface:apb:1.0 S_APB_GP0 PSLVERR";


begin

enb <= s_apb_gp0_penable and s_apb_gp0_pwrite and s_apb_gp0_psel;
web <= s_apb_gp0_pwrite;
addrb <= s_apb_gp0_paddr;
dob <= s_apb_gp0_pwdata;

end architecture;