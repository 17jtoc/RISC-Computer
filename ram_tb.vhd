LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY ram_tb IS
END ENTITY;

ARCHITECTURE behavioural OF ram_tb IS
	COMPONENT ram_block
		PORT(
		clk :  IN  STD_LOGIC;
		readinput :  IN  STD_LOGIC;
		writeinput :  IN  STD_LOGIC;
		add_in :  IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		data_input :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		output :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	END COMPONENT;
	
	signal clk_tb, readinput_tb, writeinput_tb :  STD_LOGIC;
	signal add_in_tb :  STD_LOGIC_VECTOR(8 DOWNTO 0);
	signal data_input_tb, output_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);

	
	BEGIN
	
	sel_map : ram_block
	PORT MAP(
		clk => clk_tb,
		 readinput => readinput_tb,
		 writeinput => writeinput_tb,
		 add_in => add_in_tb,
		 data_input => data_input_tb,
		 output => output_tb);
		
		test : PROCESS
		BEGIN 
		clk_tb <= '0';
		readinput_tb <= '0';
		writeinput_tb <= '0';
		add_in_tb <= "000000000";
		data_input_tb <= x"00000001";
		WAIT FOR 10 ns;
		clk_tb <='1';
		writeinput_tb <= '1';
		add_in_tb <= "000001000";
		WAIT FOR 10 ns;
		writeinput_tb<='0';
		clk_tb <= '0';
		WAIT FOR 10 ns;
		clk_tb <= '1';
		readinput_tb <='1';
		
		
		WAIT;
	END PROCESS;
END ARCHITECTURE;