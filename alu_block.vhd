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
-- CREATED		"Sun Feb 23 23:23:29 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu_block IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		OP :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END alu_block;

ARCHITECTURE bdf_type OF alu_block IS 

COMPONENT alu
	PORT(Ain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Bin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 OPcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : alu
PORT MAP(Ain => A,
		 Bin => B,
		 OPcode => OP,
		 Y => Z);


END bdf_type;