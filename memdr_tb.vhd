-- mem data register
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY memdr_tb IS
END memdr_tb;
--architecture of testbench with the signal names--
ARCHITECTURE memdr_tb_arch OF memdr_tb IS
	SIGNAL clr_tb : STD_LOGIC;
	SIGNAL clk_tb : STD_LOGIC;
	SIGNAL wrt_tb : STD_LOGIC;
	SIGNAL Din_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Qout_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
--component instantiation--
COMPONENT memdr
	PORT(
		clr :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		wrt :  IN  STD_LOGIC;
		Din :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Qout:  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT memdr;

BEGIN
	DUT1 : memdr
--port mapping: between DUT and testbench--
PORT MAP(
	clr => clr_tb ,
	clk => clk_tb ,
	wrt => wrt_tb ,
	Din => Din_tb ,
	Qout => Qout_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	clr_tb <= '0';
	clk_tb <= '0';
	wrt_tb <= '0';
	Din_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	clr_tb <= '0';
	clk_tb <= '1';
	wrt_tb <= '1';
	Din_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	clr_tb <= '1';
	clk_tb <= '1';
	wrt_tb <= '1';
	Din_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	wait;
end process;
end;