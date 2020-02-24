-- rotate
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY rotator_tb IS
END rotator_tb;
--architecture of testbench with the signal names--
ARCHITECTURE rotator_tb_arch OF rotator_tb IS
	SIGNAL dir_tb :  STD_LOGIC;
	SIGNAL dis_tb :  STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL rin_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL outp_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
--component instantiation--
COMPONENT rotator
	PORT(
	dir :  IN  STD_LOGIC;
	dis :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	rin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	outp :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT rotator;

BEGIN
	DUT1 : rotator
--port mapping: between DUT and testbench--
PORT MAP(
	dir => dir_tb ,
	dis => dis_tb ,
	rin => rin_tb ,
	outp => outp_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	dir_tb <= '0';
	dis_tb <= "00010";
	rin_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	dir_tb <= '0';
	dis_tb <= "00100";
	rin_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	dir_tb <= '0';
	dis_tb <= "00010";
	rin_tb <= "11000001000000000000000000000001";
	wait for 25 ns;
	wait;
end process;
end;