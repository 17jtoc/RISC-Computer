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
-- CREATED		"Fri Feb 21 16:50:58 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cla_one IS 
	PORT
	(
		inA :  IN  STD_LOGIC;
		inB :  IN  STD_LOGIC;
		inC :  IN  STD_LOGIC;
		outG :  OUT  STD_LOGIC;
		outP :  OUT  STD_LOGIC;
		outS :  OUT  STD_LOGIC
	);
END cla_one;

ARCHITECTURE bdf_type OF cla_one IS 

COMPONENT carry_lookahead_one
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 G : OUT STD_LOGIC;
		 P : OUT STD_LOGIC;
		 S : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_carry_lookahead_one : carry_lookahead_one
PORT MAP(A => inA,
		 B => inB,
		 C => inC,
		 G => outG,
		 P => outP,
		 S => outS);


END bdf_type;