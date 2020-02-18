LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY nonrestoring_div IS
	PORT(
		Q, M: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		quotient, remainder: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END nonrestoring_div;

ARCHITECTURE behavioural OF nonrestoring_div IS

COMPONENT carry_lookahead_thirtytwo
	PORT(
		CIn 		: IN STD_LOGIC;
		A, B	: IN STD_LOGIC_VECTOR(31 downto 0);
		GOut, POut, COut : OUT STD_LOGIC;
		SOut		: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT;

COMPONENT shift
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;


SIGNAL AQ, temp1: STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL A, temp2: STD_LOGIC_VECTOR(63 DOWNTO 32);
SIGNAL w: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL n: STD_LOGIC_VECTOR(32 DOWNTO 0);
SIGNAL rv: STD_LOGIC_VECTOR(2 DOWNTO 0);


BEGIN

	A<="00000000000000000000000000000000";
	w<=Q;
	AQ <= Q;
	
	PROCESS(n,A,w,AQ,M,temp1,temp2)
	BEGIN
		n <= not M + "1";
		FOR i IN 0 to 31 LOOP
		
			temp1 <= AQ(62 DOWNTO 0);
			AQ <= temp1 & '0';

			A <= AQ(63 downto 32);
			IF A>="0" THEN
				
				temp2 <= A + n;
				A <= temp2;
				
			ELSIF A<"0" THEN
				
				temp2 <= A + M;
				A <= temp2;
				
			END IF;
			IF A>="0" THEN
				temp1 <= w + 1;
				w <= temp1;
			END IF;
		END LOOP;

		IF A>"01111111111111111111111111111111" THEN
			temp2 <= A + M;
			A <= temp2;
		END IF;
		quotient <= w;
		remainder <= A;
		
	END PROCESS;
END behavioural;