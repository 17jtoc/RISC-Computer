LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY alu_block_tb IS
END;

ARCHITECTURE behavioural OF alu_block_tb IS

	COMPONENT alu IS
		PORT(
			Ain, Bin :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			OPcode: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL A, B : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL OP : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL output : STD_LOGIC_VECTOR(63 DOWNTO 0);

BEGIN
	alu_test : alu
	PORT MAP(
		Ain => A,
		Bin => B,
		OPcode => OP,
		Y=>output
	);

	sim_process : PROCESS
	BEGIN
			WAIT FOR 0 ns;
		A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000001";
		OP<="0001";
			WAIT FOR 10 ns;
		OP<="0010";
			WAIT FOR 10 ns;
		OP<="0011";
			WAIT FOR 10 ns;
		OP<="0100";
			WAIT FOR 10 ns;
		OP<="0101";
			WAIT FOR 10 ns;
		OP<="0110";
			WAIT FOR 10 ns;
		OP<="0111";
			WAIT FOR 10 ns;
		OP<="1000";
			WAIT FOR 10 ns;
		OP<="1001";
			WAIT FOR 10 ns;
		OP<="1010";
			WAIT FOR 10 ns;
		OP<="1011";
			WAIT FOR 10 ns;
		OP<="1100";
			WAIT;
		END PROCESS sim_process;
END;

