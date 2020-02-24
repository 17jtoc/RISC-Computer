LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all; 
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

BEGIN
	PROCESS(direction,distance,input)
	variable dis : STD_LOGIC_VECTOR(4 DOWNTO 0);
	variable store : STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable storea: STD_LOGIC_VECTOR(31 DOWNTO 0);
	BEGIN
		storea := "00000000000000000000000000000000";
		dis := distance;
		store(31 DOWNTO 0) := input(31 DOWNTO 0);
		IF direction = '0' THEN
			FOR i IN 0 TO 31 LOOP
				IF dis(4 DOWNTO 0) = "00000" THEN
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0);
				ELSE
					storea(31 DOWNTO 1) := store(30 DOWNTO 0);
					store := storea(31 DOWNTO 1) & '0';
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0) - '1';
				END IF;
				END LOOP;
		ELSIF direction = '1' THEN
			FOR i IN 0 TO 31 LOOP
				IF dis(4 DOWNTO 0) = "00000" THEN
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0);
				ELSE
					storea(30 DOWNTO 0) := store(31 DOWNTO 1);
					store := '0' & storea(30 DOWNTO 0);
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0) - '1';
				END IF;
				END LOOP;
		END IF;
		output <= store(31 DOWNTO 0);
		
	END PROCESS;
END ARCHITECTURE behavioural;