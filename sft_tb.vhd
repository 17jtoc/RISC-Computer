-- shift
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY sft_tb IS
END sft_tb;
--architecture of testbench with the signal names--
ARCHITECTURE sft_tb_arch OF sft_tb IS
	SIGNAL dir_tb :  STD_LOGIC;
	SIGNAL dis_tb :  STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL inp_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL outp_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
--component instantiation--
COMPONENT sft
	PORT(
	dir :  IN  STD_LOGIC;
	dis :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	inp :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
	outp :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT sft;

BEGIN
	DUT1 : sft
--port mapping: between DUT and testbench--
PORT MAP(
	dir => dir_tb ,
	dis => dis_tb ,
	inp => inp_tb ,
	outp => outp_tb);
	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	dir_tb <= '0';
	dis_tb <= "00001";
	inp_tb <= "11111111111111111111111111111111";
	wait for 25 ns;
	wait;
end process;
end;