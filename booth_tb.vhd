-- booth
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY booth_tb IS
END booth_tb;
--architecture of testbench with the signal names--
ARCHITECTURE booth_tb_arch OF booth_tb IS
	SIGNAL inQ_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL inB_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL outC_tb : STD_LOGIC_VECTOR(63 DOWNTO 0);
	
--component instantiation--
COMPONENT booth
	PORT(
		Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Qin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Cout :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT booth;

BEGIN
	DUT1 : booth
--port mapping: between DUT and testbench--
PORT MAP(
	Bin => inB_tb ,
	Qin => inQ_tb ,
	Cout => outC_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	inQ_tb <= "00000000000000000000000000000010";
	inB_tb <= "00000000000000000000000000000010";
	wait for 25 ns;
	inQ_tb <= "11111111111111111111111111111111";
	inB_tb <= "00000000000000000000000000000010";
	wait for 25 ns;
	inQ_tb <= "00000000000000000000000000100110";
	inB_tb <= "00000000000000000000100000001010";
	wait for 25 ns;
	wait;
end process; 
end;