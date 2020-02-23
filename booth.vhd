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
-- CREATED		"Sat Feb 22 21:44:58 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY booth IS 
	PORT
	(
		Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Qin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Cout :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END booth;

ARCHITECTURE bdf_type OF booth IS 

COMPONENT booth_multiplier
	PORT(B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_multiplier : booth_multiplier
PORT MAP(B => Bin,
		 Q => Qin,
		 C => Cout);


END bdf_type;