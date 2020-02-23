-- mdr and mux
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY mdr_and_mux_tb IS
END mdr_and_mux_tb;
--architecture of testbench with the signal names--
ARCHITECTURE mdr_and_mux_tb_arch OF mdr_and_mux_tb IS
	SIGNAL clr_tb : STD_LOGIC;
	SIGNAL clk_tb :  STD_LOGIC;
	SIGNAL wrt_tb :  STD_LOGIC;
	SIGNAL rd_tb :  STD_LOGIC;
	SIGNAL bmIn_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mdataIn_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Qout_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	
--component instantiation--
COMPONENT mdr_and_mux
	PORT(
	clr, clk, wrt, rd : IN STD_LOGIC;
	bmIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	mdataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Qout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT mdr_and_mux;

BEGIN
	DUT1 : mdr_and_mux
--port mapping: between DUT and testbench--
PORT MAP(
	clr => clr_tb ,
	clk => clk_tb ,
	wrt => wrt_tb ,
	rd => rd_tb ,
	bmIn => bmIn_tb ,
	mdataIn => mdataIn_tb ,
	Qout => Qout_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	clr_tb <= '0';
	clk_tb <= '0';
	wrt_tb <= '1';
	rd_tb <= '1';
	bmIn_tb <= "00000000000000000000000000000001";
	mdataIn_tb <= "00000000000000000000000000001000";
	wait for 25 ns;
	clk_tb <= '1';
	wait for 25 ns;
	wait;
end process;
end;