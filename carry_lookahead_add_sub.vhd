LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY carry_lookahead_add_sub IS
	PORT(
	CIn, SUB 			: IN STD_LOGIC;
	A, B					: IN STD_LOGIC_VECTOR(31 downto 0);
	GOut, POut, COut 	: OUT STD_LOGIC;
	SOut					: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END carry_lookahead_add_sub;

ARCHITECTURE behavioral OF carry_lookahead_add_sub IS

COMPONENT carry_lookahead_one
PORT(
	A, B, CIn : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC);
END COMPONENT;

COMPONENT carry_lookahead_sixteen
PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(15 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(15 downto 0));
END COMPONENT;

COMPONENT carry_lookahead_thirtytwo
PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(31 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;

COMPONENT negate
	PORT(
	A : IN STD_LOGIC_VECTOR(31 downto 0);
	B : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;

SIGNAL G, P	: STD_LOGIC;
SIGNAL C : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL N : STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN
	
	--NEG : negate PORT MAP(B(31 downto 0), N(31 downto 0));
	
	PROCESS(SUB, B, N)
	BEGIN
		IF SUB = '1' THEN
			N <= (NOT B) + "00000000000000000000000000000001";
		ELSE
			N <= B;
		END IF;
	END PROCESS;
	
	
	
	C(0) <= CIn;
	CLA32 : carry_lookahead_thirtytwo PORT MAP(C(0),A(31 downto 0),N(31 downto 0),G,P,C(1),S(31 downto 0));
	COut <= C(1);
	GOut <= G;
	POut <= P;
	SOut <= S;
	
	
	
	
END behavioral;
	