-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Fri Feb 28 15:43:29 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY sel_enc_block IS 
	PORT
	(
		Gra_in :  IN  STD_LOGIC;
		Grb_in :  IN  STD_LOGIC;
		Grc_in :  IN  STD_LOGIC;
		Rinin :  IN  STD_LOGIC;
		Routin :  IN  STD_LOGIC;
		BA_in :  IN  STD_LOGIC;
		IR_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		C_sign_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R0_inout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		R0_outout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END sel_enc_block;

ARCHITECTURE bdf_type OF sel_enc_block IS 

COMPONENT select_encode
	PORT(Gra : IN STD_LOGIC;
		 Grb : IN STD_LOGIC;
		 Grc : IN STD_LOGIC;
		 Rin : IN STD_LOGIC;
		 Rout : IN STD_LOGIC;
		 BAout : IN STD_LOGIC;
		 IR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C_sign_extended : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0in : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 R0out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : select_encode
PORT MAP(Gra => Gra_in,
		 Grb => Grb_in,
		 Grc => Grc_in,
		 Rin => Rinin,
		 Rout => Routin,
		 BAout => BA_in,
		 IR => IR_in,
		 C_sign_extended => C_sign_out,
		 R0in => R0_inout,
		 R0out => R0_outout);


END bdf_type;