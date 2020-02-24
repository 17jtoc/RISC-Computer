LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY div_block_tb IS
END;

ARCHITECTURE behavioural OF div_block_tb IS

	COMPONENT div_block IS
		PORT(
			dividend, divisor: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			quot: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			remain: OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL Qin, Min, quo: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL rema : STD_LOGIC_VECTOR(32 DOWNTO 0);

BEGIN
	div_test : div_block
	PORT MAP(
		dividend =>Qin,
		divisor => Min,
		quot => quo,
		remain => rema
	);

	sim_process : PROCESS
	BEGIN
		WAIT FOR 0 ns;
	Qin <= "11111111111111111111111111111111";
	Min <= "00000000000000000000000000000001";
		WAIT;
	END PROCESS sim_process;
END;
