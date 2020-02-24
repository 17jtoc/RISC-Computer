LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
ENTITY nonrestoring_div IS
PORT(
Q, M: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
quotient: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
remainder: OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
);
END nonrestoring_div;
ARCHITECTURE behavioural OF nonrestoring_div IS



BEGIN
PROCESS(Q,M)
variable AQ : STD_LOGIC_VECTOR(64 DOWNTO 0);
variable temp1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
variable w: STD_LOGIC_VECTOR(31 DOWNTO 0);
variable A, n, em: STD_LOGIC_VECTOR(32 DOWNTO 0);

BEGIN
em :='0' & M;
n := not em + '1';
A:=x"00000000"&'0';
w := Q;

FOR i IN 0 to 31 LOOP
AQ(64 DOWNTO 32) := A;
AQ(31 DOWNTO 0) := w;
temp1 := AQ(63 DOWNTO 0);
AQ := temp1 & '0';
A := AQ(64 downto 32);
w := AQ(31 DOWNTO 0);

IF A<b"100000000000000000000000000000000" THEN
A := A + n;
ELSE 
A := A + em;
END IF;
IF A<b"100000000000000000000000000000000" THEN
w := w + '1';
END IF;
END LOOP;
IF A>b"011111111111111111111111111111111" THEN
A := A + M;
END IF;
quotient <=w;
remainder <= A;
END PROCESS;
END behavioural;