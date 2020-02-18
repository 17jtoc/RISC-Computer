LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 


ENTITY rotate IS
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 downto 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END rotate;

ARCHITECTURE behavioural OF rotate IS
SIGNAL storea, store : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL storeb : STD_LOGIC;

BEGIN
	PROCESS(storea,storeb,input,direction)
	BEGIN
		IF direction = '0' THEN
			FOR i IN 0 TO to_integer(unsigned(distance)) LOOP
				storea <= input(30 DOWNTO 0);
				storeb <= input(31);
				store <= storea & storeb;
			END LOOP;
		ELSIF direction = '1' THEN
			FOR i IN 0 TO to_integer(unsigned(distance)) LOOP
				storea <= input(31 DOWNTO 1);
				storeb <= input(0);
				store <= storeb & storea;
			END LOOP;
		END IF;
		output<=store;
	END PROCESS;
END ARCHITECTURE behavioural;