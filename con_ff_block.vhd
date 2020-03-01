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
-- CREATED		"Sun Mar 01 18:23:46 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY con_ff_block IS 
	PORT
	(
		bus_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ir_in :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		conff_out :  OUT  STD_LOGIC
	);
END con_ff_block;

ARCHITECTURE bdf_type OF con_ff_block IS 

COMPONENT con_ff
	PORT(busin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 IR : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 con_out : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : con_ff
PORT MAP(busin => bus_in,
		 IR => ir_in,
		 con_out => conff_out);


END bdf_type;