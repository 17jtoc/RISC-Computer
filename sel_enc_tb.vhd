LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY sel_enc_tb IS
END ENTITY;

ARCHITECTURE behavioural OF sel_enc_tb IS
	COMPONENT select_encode_block
		PORT(
		gra_in :  IN  STD_LOGIC;
		grb_in :  IN  STD_LOGIC;
		grc_in :  IN  STD_LOGIC;
		r_in :  IN  STD_LOGIC;
		r_out :  IN  STD_LOGIC;
		ba_in :  IN  STD_LOGIC;
		ir_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		cout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rinout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		routout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	
	signal IR_tb, C_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Gra_tb, Grb_tb, Grc_tb, Rin_tb, Rout_tb,BAout_tb : STD_LOGIC;
	signal R0in_tb, R0out_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	BEGIN
	
	sel_map : select_encode_block
	PORT MAP(
		ir_in => IR_tb,
		gra_in => Gra_tb,
		grb_in => Grb_tb,
		grc_in => Grc_tb,
		r_in => Rin_tb,
		r_out => Rout_tb,
		ba_in => BAout_tb,
		rinout => R0in_tb,
		routout => R0out_tb,
		cout => C_tb
		);
		
		test : PROCESS
		BEGIN 
		IR_tb <= "00000111101001100000000000000000";
		Gra_tb <='0';
		Grb_tb<='0';
		Grc_tb <= '0';
		Rin_tb <= '0';
		Rout_tb <='0';
		BAout_tb <= '0';
		
		WAIT FOR 10 ns;
		Gra_tb <='1';
		Grb_tb<='0';
		Grc_tb <= '0';
		Rin_tb <= '1';
		Rout_tb <='0';
		BAout_tb <= '0';
		
		WAIT FOR 10 ns;
		Gra_tb <='1';
		Grb_tb<='0';
		Grc_tb <= '0';
		Rin_tb <= '0';
		Rout_tb <='1';
		BAout_tb <= '1';
		
		WAIT FOR 10 ns;
		Gra_tb <='0';
		Grb_tb<='1';
		Grc_tb <= '0';
		Rin_tb <= '1';
		Rout_tb <='1';
		BAout_tb <= '1';
		
		WAIT FOR 10 ns;
		Gra_tb <='0';
		Grb_tb<='1';
		Grc_tb <= '1';
		Rin_tb <= '1';
		Rout_tb <='1';
		BAout_tb <= '1';
		WAIT;
	END PROCESS;
END ARCHITECTURE;