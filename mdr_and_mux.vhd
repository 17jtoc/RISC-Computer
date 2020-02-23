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
-- CREATED		"Sun Feb 23 10:54:08 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mdr_and_mux IS 
	PORT
	(
		clr :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		wrt :  IN  STD_LOGIC;
		rd :  IN  STD_LOGIC;
		bmIn :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mdataIn :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Qout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END mdr_and_mux;

ARCHITECTURE bdf_type OF mdr_and_mux IS 

COMPONENT mdr
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr_mux
	PORT(RD : IN STD_LOGIC;
		 bmOUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdataIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_mdr : mdr
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => SYNTHESIZED_WIRE_0,
		 Q => Qout);


b2v_mux : mdr_mux
PORT MAP(RD => rd,
		 bmOUT => bmIn,
		 mdataIN => mdataIn,
		 mdOUT => SYNTHESIZED_WIRE_0);


END bdf_type;