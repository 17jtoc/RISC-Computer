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
-- CREATED		"Fri Feb 28 17:14:01 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY select_encode_block IS 
	PORT
	(
		gra_in :  IN  STD_LOGIC;
		grb_in :  IN  STD_LOGIC;
		grc_in :  IN  STD_LOGIC;
		r_in :  IN  STD_LOGIC;
		r_out :  IN  STD_LOGIC;
		ba_in :  IN  STD_LOGIC;
		ir_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		cout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rinout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		routout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END select_encode_block;

ARCHITECTURE bdf_type OF select_encode_block IS 

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
PORT MAP(Gra => gra_in,
		 Grb => grb_in,
		 Grc => grc_in,
		 Rin => r_in,
		 Rout => r_out,
		 BAout => ba_in,
		 IR => ir_in,
		 C_sign_extended => cout,
		 R0in => rinout,
		 R0out => routout);


END bdf_type;