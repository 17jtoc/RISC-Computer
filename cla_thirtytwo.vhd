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
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sat Feb 22 16:59:12 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cla_thirtytwo IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		Ain :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Gout :  OUT  STD_LOGIC;
		Pout :  OUT  STD_LOGIC;
		Cout :  OUT  STD_LOGIC;
		Sout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END cla_thirtytwo;

ARCHITECTURE bdf_type OF cla_thirtytwo IS 

COMPONENT carry_lookahead_thirtytwo
	PORT(CIn : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 GOut : OUT STD_LOGIC;
		 POut : OUT STD_LOGIC;
		 COut : OUT STD_LOGIC;
		 SOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : carry_lookahead_thirtytwo
PORT MAP(CIn => Cin,
		 A => Ain,
		 B => Bin,
		 GOut => Gout,
		 POut => Pout,
		 COut => Cout,
		 SOut => Sout);


END bdf_type;