-- neg
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--entity declaration--
Entity neg_tb IS
END neg_tb;

--architecture of testbench with the signal names--
ARCHITECTURE neg_tb_arch OF neg_tb IS
	
	SIGNAL Ain_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Bout_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	

COMPONENT neg
PORT(
	Ain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Bout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;
	
BEGIN
	DUT1 : neg
--port mapping: between DUT and testbench--
PORT MAP(
	Ain => Ain_tb ,
	Bout => Bout_tb
	);

--test logic--
sim_process : process

begin
	wait for 0 ns;
	Ain_tb <= "00000000000000010000000000000001";
	wait for 25 ns;
	Ain_tb <= "11111111111111111111111111111111";
	wait for 25 ns;
	Ain_tb <= "10010000000000010000011000000000";
	wait for 25 ns;
	Ain_tb <= "00000000000000000000000000000000";
	wait for 25 ns;
	wait;
end process;
end;

