-- cla_sixteen_tb
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--entity declaration--
Entity cla_sixteen_tb IS
END cla_sixteen_tb;

--architecture of testbench with the signal names--
ARCHITECTURE cla_sixteen_tb_arch OF cla_sixteen_tb IS
	
	SIGNAL inC_tb : STD_LOGIC;
	SIGNAL inA_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL inB_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL outG_tb : STD_LOGIC;
	SIGNAL outP_tb : STD_LOGIC;
	SIGNAL outC_tb : STD_LOGIC;
	SIGNAL outS_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);

	COMPONENT carry_lookahead_one
PORT(
	A, B, C : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC);
END COMPONENT;
	
COMPONENT cla_sixteen
PORT(
	Cin 		: IN STD_LOGIC;
	Ain, Bin	: IN STD_LOGIC_VECTOR(15 downto 0);
	Gout, Pout, COut : OUT STD_LOGIC;
	Sout		: OUT STD_LOGIC_VECTOR(15 downto 0));
END COMPONENT;

BEGIN
	DUT1 : cla_sixteen
--port mapping: between DUT and testbench--
PORT MAP(
	Cin => inC_tb ,
	Ain => inA_tb ,
	Bin => inB_tb ,
	Gout => outG_tb ,
	Pout => outP_tb ,
	Cout => outC_tb ,
	Sout => outS_tb);

--test logic--
sim_process : process

begin
	wait for 0 ns;
	inC_tb <= '0';
	inA_tb <= "0000000000000001";
	inB_tb <= "0000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "1000000000000001";
	inB_tb <= "1000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "1100100001000000";
	inB_tb <= "0100001000110001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "1010101010101010";
	inB_tb <= "0101010101010101";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "1111111111111111";
	inB_tb <= "1111111111111111";
	wait for 25 ns;
	wait;
end process;
end;











