-- cla1_tb.vhd file: carry_lookahead_one.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY cla1_tb IS
END;
--architecture of testbench with the signal names--
ARCHITECTURE cla1_tb_arch OF cla1_tb IS
	SIGNAL inA_tb : STD_LOGIC;
	SIGNAL inB_tb : STD_LOGIC;
	SIGNAL inC_tb : STD_LOGIC;
	SIGNAL outG_tb : STD_LOGIC;
	SIGNAL outP_tb : STD_LOGIC;
	SIGNAL outS_tb : STD_LOGIC;
--component instantiation--
COMPONENT carry_lookahead_one
	PORT(
	A, B, C : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC
	);
END COMPONENT carry_lookahead_one;
BEGIN
	DUT1 : carry_lookahead_one
--port mapping: between DUT and testbench--
PORT MAP(
	A => inA_tb ,
	B => inB_tb ,
	C => inC_tb ,
	G => outG_tb ,
	P => outP_tb ,
	S => outS_tb);
	
--test logic--
sim_process: process

begin
	inA_tb <= '0';
	inB_tb <= '0';
	wait for 20ns;
	inA_tb <= '1';
	inB_tb <= '0';
	wait for 20ns;
	inA_tb <= '0';
	inB_tb <= '1';
	wait for 20ns;
	inA_tb <= '1';
	inB_tb <= '1';
	wait for 20ns;
end process sim_process;
end;



