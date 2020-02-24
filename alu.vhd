LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

LIBRARY work;

ENTITY alu IS 
	PORT
	(
		Ain, Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		OPcode: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Y :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END ALU;

ARCHITECTURE behavioural OF alu IS 

--components

COMPONENT booth_multiplier IS
	PORT(
		Q, B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		C 	  : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT carry_lookahead_thirtytwo IS 
	PORT(
		CIn 		: IN STD_LOGIC;
		A, B	: IN STD_LOGIC_VECTOR(31 downto 0);
		GOut, POut, COut : OUT STD_LOGIC;
		SOut		: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;

COMPONENT nonrestoring_div IS
	PORT(
		Q, M: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		quotient: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		remainder: OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rotate IS
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 downto 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shift IS
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 downto 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT negate IS
	PORT(
	A : IN STD_LOGIC_VECTOR(31 downto 0);
	B : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;

--signals

SIGNAL add, sub, div, sh, rota, neg, b_neg : STD_LOGIC_VECTOR(31 DOWNTO 0);

SIGNAL div_rem : STD_LOGIC_VECTOR(32 DOWNTO 0);

SIGNAL mul: STD_LOGIC_VECTOR(63 DOWNTO 0);


SIGNAL	dist :  STD_LOGIC_VECTOR(4 DOWNTO 0);

SIGNAL add1, add2, add3, add4, add5, add6, add7, dir: STD_LOGIC;


BEGIN
--port mapping
multiply : booth_multiplier
PORT MAP(
	Q=>Ain,
	B=>Bin,
	C=>mul
);

addition : carry_lookahead_thirtytwo
PORT MAP(
	CIn =>add1,
	A=>Ain,
	B=>Bin,
	GOut=>add2,
	POut=>add3, 
	COut=> add4,
	SOut => add
);

subtraction : carry_lookahead_thirtytwo
PORT MAP(
	CIn =>add1,
	A=>Ain,
	B=>b_neg,
	GOut=>add5,
	POut=>add6, 
	COut=> add7,
	SOut => sub
);

division : nonrestoring_div
PORT MAP(
	Q =>Ain, 
	M=>Bin,
	quotient=>div, 
	remainder=>div_rem
);

rotation : rotate
PORT MAP(
	input => Ain,
	direction=>dir,
	distance => dist,
	output => rota
);

shiftop : shift
PORT MAP(
	input => Ain,
	direction=>dir,
	distance => dist,
	output => sh
);

negation : negate
PORT MAP(
	A => Ain,
	B => neg
);

-- process
alu :  PROCESS(
	Ain, Bin, OPcode, add, sub, mul, div, div_rem, sh, rota, neg)
BEGIN

--AND
	IF (OPcode = "0001") THEN
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= (Ain and Bin);
--OR
	ELSIF (OPcode = "0010") THEN
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= (Ain or Bin);
--ADD
	ELSIF (OPcode = "0011") THEN
		add1<='0';
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= add;
--SUB 
	ELSIF (OPcode = "0100") THEN
		add1<='0';
		b_neg <= NOT Bin + "00000000000000000000000000000001";
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= sub;
-- MUL
	ELSIF (OPcode = "0101") THEN
		Y<=mul;
--DIV 
	ELSIF (OPcode = "0110") THEN
		Y(63 DOWNTO 32) <= div_rem(31 DOWNTO 0);
		Y(31 DOWNTO 0) <= div;
--SHL
	ELSIF (OPcode = "0111") THEN
		dir <= '0';
		dist <= Bin(4 DOWNTO 0);
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= sh;
--SHR
	ELSIF (OPcode = "1000") THEN
		dir <= '1';
		dist <= Bin(4 DOWNTO 0);
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= sh;
--ROTL
	ELSIF (OPcode = "1001") THEN
		dir <= '0';
		dist <= Bin(4 DOWNTO 0);
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= rota;
--ROTR
	ELSIF (OPcode = "1010") THEN
		dir <= '1';
		dist <= Bin(4 DOWNTO 0);
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= rota;
--NEG
	ELSIF (OPcode = "1011") THEN
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= neg;
--NOT
	ELSIF (OPcode = "1100") THEN
		Y(63 DOWNTO 32) <= x"00000000";
		Y(31 DOWNTO 0) <= not Ain; 
	end if;
end process;
END behavioural;
