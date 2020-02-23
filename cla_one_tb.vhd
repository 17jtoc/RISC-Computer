-- cla1_tb.vhd file: carry_lookahead_one.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY cla_one_tb IS
END cla_one_tb;
--architecture of testbench with the signal names--
ARCHITECTURE cla_one_tb_arch OF cla_one_tb IS
	SIGNAL inA_tb : STD_LOGIC;
	SIGNAL inB_tb : STD_LOGIC;
	SIGNAL inC_tb : STD_LOGIC;
	SIGNAL outG_tb : STD_LOGIC;
	SIGNAL outP_tb : STD_LOGIC;
	SIGNAL outS_tb : STD_LOGIC;
	
--component instantiation--
COMPONENT cla_one
	PORT(
	inA, inB, inC : IN STD_LOGIC;
	outG, outP, outS : OUT STD_LOGIC
	);
END COMPONENT cla_one;

BEGIN
	DUT1 : cla_one
--port mapping: between DUT and testbench--
PORT MAP(
	inA => inA_tb ,
	inB => inB_tb ,
	inC => inC_tb ,
	outG => outG_tb ,
	outP => outP_tb ,
	outS => outS_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	inA_tb <= '0';
	inB_tb <= '0';
	inC_tb <= '0';
	wait for 25 ns;
	inA_tb <= '1';
	inB_tb <= '0';
	inC_tb <= '0';
	wait for 25 ns;
	inA_tb <= '0';
	inB_tb <= '1';
	inC_tb <= '0';
	wait for 25 ns;
	inA_tb <= '1';
	inB_tb <= '1';
	inC_tb <= '0';
	wait for 25 ns;
	wait;
end process;
end;