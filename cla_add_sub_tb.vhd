-- cla_add_sub_tb
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--entity declaration--
Entity cla_add_sub_tb IS
END cla_add_sub_tb;

--architecture of testbench with the signal names--
ARCHITECTURE cla_add_sub_tb_arch OF cla_add_sub_tb IS
	
	SIGNAL inC_tb : STD_LOGIC;
	SIGNAL inSUB_tb : STD_LOGIC;
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

COMPONENT carry_lookahead_thirtytwo
PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(31 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;
	
COMPONENT cla_add_sub
PORT(
	Cin 		: IN STD_LOGIC;
	SUBin 		: IN STD_LOGIC;
	Ain, Bin	: IN STD_LOGIC_VECTOR(31 downto 0);
	Gout, Pout, COut : OUT STD_LOGIC;
	Sout		: OUT STD_LOGIC_VECTOR(31 downto 0));
END COMPONENT;

BEGIN
	DUT1 : cla_add_sub
--port mapping: between DUT and testbench--
PORT MAP(
	Cin => inC_tb ,
	SUBin => inSUB_tb ,
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
	inSUB_tb <= '1';
	inA_tb <= "00000000000000010000000000000001";
	inB_tb <= "00000000000000010000000000000001";
	wait for 25 ns;
	inC_tb <= '0';
	inSUB_tb <= '0';
	inA_tb <= "00000000000000010000000000000011";
	inB_tb <= "00000000000000010000000000000011";
	wait for 25 ns;
	inC_tb <= '0';
	inSUB_tb <= '1';
	inA_tb <= "10010000001000010000001000000001";
	inB_tb <= "00010000010000010000000001000001";
	wait for 25 ns;
	inC_tb <= '0';
	inSUB_tb <= '1';
	inA_tb <= "00000010001000010000000000000001";
	inB_tb <= "00000001000000010000000000000001";
	wait for 25 ns;
	
	wait;
end process;
end;

