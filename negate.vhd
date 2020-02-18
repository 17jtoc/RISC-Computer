LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY negate IS
	PORT(
	A : IN STD_LOGIC_VECTOR(31 downto 0);
	B : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END negate;

ARCHITECTURE behavioral OF negate IS

SIGNAL N	: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
	NEGATE:
	PROCESS(A)
	BEGIN
	
		N <= NOT A;
		B <= N + "00000000000000000000000000000001";
		
	END PROCESS;
END behavioral;
	
