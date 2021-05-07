--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Wed Apr 28 17:29:07 2021
--Host        : LAPTOP-97RQG6MA running 64-bit major release  (build 9200)
--Command     : generate_target Audio_Effect_Box_wrapper.bd
--Design      : Audio_Effect_Box_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Audio_Effect_Box_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    au_bclk_r : out STD_LOGIC;
    au_din_r : in STD_LOGIC;
    au_dout_r : out STD_LOGIC;
    au_mclk_r : out STD_LOGIC;
    au_wclk_r : out STD_LOGIC;
    audio_i2c_scl_io : inout STD_LOGIC;
    audio_i2c_sda_io : inout STD_LOGIC
  );
end Audio_Effect_Box_wrapper;

architecture STRUCTURE of Audio_Effect_Box_wrapper is
  component Audio_Effect_Box is
  port (
    au_dout_r : out STD_LOGIC;
    au_din_r : in STD_LOGIC;
    au_bclk_r : out STD_LOGIC;
    au_mclk_r : out STD_LOGIC;
    au_wclk_r : out STD_LOGIC;
    audio_i2c_scl_i : in STD_LOGIC;
    audio_i2c_scl_o : out STD_LOGIC;
    audio_i2c_scl_t : out STD_LOGIC;
    audio_i2c_sda_i : in STD_LOGIC;
    audio_i2c_sda_o : out STD_LOGIC;
    audio_i2c_sda_t : out STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC
  );
  end component Audio_Effect_Box;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal audio_i2c_scl_i : STD_LOGIC;
  signal audio_i2c_scl_o : STD_LOGIC;
  signal audio_i2c_scl_t : STD_LOGIC;
  signal audio_i2c_sda_i : STD_LOGIC;
  signal audio_i2c_sda_o : STD_LOGIC;
  signal audio_i2c_sda_t : STD_LOGIC;
begin
Audio_Effect_Box_i: component Audio_Effect_Box
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      au_bclk_r => au_bclk_r,
      au_din_r => au_din_r,
      au_dout_r => au_dout_r,
      au_mclk_r => au_mclk_r,
      au_wclk_r => au_wclk_r,
      audio_i2c_scl_i => audio_i2c_scl_i,
      audio_i2c_scl_o => audio_i2c_scl_o,
      audio_i2c_scl_t => audio_i2c_scl_t,
      audio_i2c_sda_i => audio_i2c_sda_i,
      audio_i2c_sda_o => audio_i2c_sda_o,
      audio_i2c_sda_t => audio_i2c_sda_t
    );
audio_i2c_scl_iobuf: component IOBUF
     port map (
      I => audio_i2c_scl_o,
      IO => audio_i2c_scl_io,
      O => audio_i2c_scl_i,
      T => audio_i2c_scl_t
    );
audio_i2c_sda_iobuf: component IOBUF
     port map (
      I => audio_i2c_sda_o,
      IO => audio_i2c_sda_io,
      O => audio_i2c_sda_i,
      T => audio_i2c_sda_t
    );
end STRUCTURE;
