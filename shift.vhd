LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

ENTITY shift IS
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 downto 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END shift;

ARCHITECTURE behavioural OF shift IS
SIGNAL storea, store : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	PROCESS(storea,store,direction)
	BEGIN
		IF direction = '0' THEN
			FOR i IN 0 TO to_integer(unsigned(distance)) LOOP
					storea <= input(30 DOWNTO 0);
					store <= storea & '0';
				END LOOP;
		ELSIF direction = '1' THEN
			FOR i IN 0 TO to_integer(unsigned(distance)) LOOP
					storea <= input(31 DOWNTO 1);
					store <= '0' & storea;
				END LOOP;
		END IF;
	END PROCESS;
END ARCHITECTURE behavioural;