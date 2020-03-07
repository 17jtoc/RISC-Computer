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
-- CREATED		"Sat Mar 07 15:07:49 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ram_block IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		readinput :  IN  STD_LOGIC;
		writeinput :  IN  STD_LOGIC;
		add_in :  IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		data_input :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		output :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ram_block;

ARCHITECTURE bdf_type OF ram_block IS 

COMPONENT ram
	PORT(clock : IN STD_LOGIC;
		 readin : IN STD_LOGIC;
		 writein : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : ram
PORT MAP(clock => clk,
		 readin => readinput,
		 writein => writeinput,
		 address => add_in,
		 datain => data_input,
		 dataout => output);


END bdf_type;