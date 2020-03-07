LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY conff_tb IS
END ENTITY;

ARCHITECTURE behavioural OF conff_tb IS
	COMPONENT con_ff_block
		PORT(
		bus_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ir_in :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		conff_out :  OUT  STD_LOGIC
	);
	END COMPONENT;
	
	signal busin_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal ir_tb : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal conff_out_tb : STD_LOGIC;
	
	BEGIN
	
	sel_map : con_ff_block
	PORT MAP(
		bus_in => busin_tb,
		ir_in => ir_tb,
		conff_out => conff_out_tb
		);
		
		test : PROCESS
		BEGIN 
		busin_tb <= x"00000000";
		ir_tb <= "00";
		WAIT FOR 10 ns;
		ir_tb <= "01";
		WAIT FOR 10 ns;
		ir_tb <= "10";
		WAIT FOR 10 ns;
		ir_tb <= "11";
		WAIT FOR 10 ns;
		busin_tb <= x"00001000";
		WAIT FOR 10 ns;
		ir_tb<= "00";
		WAIT FOR 10 ns;
		ir_tb<= "01";
		WAIT FOR 10 ns;
		busin_tb <= x"81000000";
		ir_tb <= "10";
		WAIT FOR 10 ns;
		ir_tb <= "11";
		
		WAIT;
	END PROCESS;
END ARCHITECTURE;