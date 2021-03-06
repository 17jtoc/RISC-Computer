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
-- CREATED		"Sat Feb 22 23:27:50 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reg IS 
	PORT
	(
		clr :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		wrt :  IN  STD_LOGIC;
		Din :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Qout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END reg;

ARCHITECTURE bdf_type OF reg IS 

COMPONENT reg_one
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_register : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => Din,
		 Q => Qout);


END bdf_type;