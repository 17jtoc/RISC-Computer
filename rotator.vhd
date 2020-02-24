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
-- CREATED		"Sun Feb 23 21:26:40 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY rotator IS 
	PORT
	(
		dir :  IN  STD_LOGIC;
		dis :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		outp :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END rotator;

ARCHITECTURE bdf_type OF rotator IS 

COMPONENT rotate
	PORT(direction : IN STD_LOGIC;
		 distance : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : rotate
PORT MAP(direction => dir,
		 distance => dis,
		 input => rin,
		 output => outp);


END bdf_type;