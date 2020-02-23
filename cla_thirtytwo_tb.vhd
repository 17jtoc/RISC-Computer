-- cla_thirtytwo_tb
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--entity declaration--
Entity cla_thirtytwo_tb IS
END cla_thirtytwo_tb;

--architecture of testbench with the signal names--
ARCHITECTURE cla_thirtytwo_tb_arch OF cla_thirtytwo_tb IS
	
	SIGNAL inC_tb : STD_LOGIC;
	SIGNAL inA_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL inB_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL outG_tb : STD_LOGIC;
	SIGNAL outP_tb : STD_LOGIC;
	SIGNAL outC_tb : STD_LOGIC;
	SIGNAL outS_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT carry_lookahead_one
PORT(
	A, B, C : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC);
END COMPONENT;
	
COMPONENT carry_lookahead_sixteen
PORT(
	CIn 					: IN STD_LOGIC;
	A, B					: IN STD_LOGIC_VECTOR(15 downto 0);
	GOut, POut, COut 	: OUT STD_LOGIC;
	SOut					: OUT STD_LOGIC_VECTOR(15 downto 0));
END COMPONENT;
	
COMPONENT cla_thirtytwo
PORT(
	Cin 		: IN STD_LOGIC;
	Ain, Bin	: IN STD_LOGIC_VECTOR(31 downto 0);
	Gout, Pout, COut : OUT STD_LOGIC;
	Sout		: OUT STD_LOGIC_VECTOR(31 downto 0));
END COMPONENT;

BEGIN
	DUT1 : cla_thirtytwo
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
	inA_tb <= "00000000000000010000000000000001";
	inB_tb <= "00000000000000010000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "10000000000000010000000000000001";
	inB_tb <= "10000000000000010000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "11001000010000000000000000000001";
	inB_tb <= "01000010001100010000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "10101010101010100000000000000001";
	inB_tb <= "01010101010101010000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inA_tb <= "11111111111111110000000000000001";
	inB_tb <= "11111111111111110000000000000001";
	wait for 25 ns;
	wait;
end process;
end;


