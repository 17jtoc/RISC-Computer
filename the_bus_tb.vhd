-- bus
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--entity declaration--
ENTITY the_bus_tb IS
END the_bus_tb;
--architecture of testbench with the signal names--
ARCHITECTURE the_bus_tb_arch OF the_bus_tb IS
	SIGNAL clr_tb :    STD_LOGIC;
	SIGNAL clk_tb :    STD_LOGIC;
	SIGNAL wrt_tb :   STD_LOGIC;
	SIGNAL rd_tb :   STD_LOGIC;
	SIGNAL inhi_tb :    STD_LOGIC;
	SIGNAL inlo_tb :    STD_LOGIC;
	SIGNAL inzhi_tb :    STD_LOGIC;
	SIGNAL inzlo_tb :    STD_LOGIC;
	SIGNAL inpc_tb :   STD_LOGIC;
	SIGNAL inmdr_tb :    STD_LOGIC;
	SIGNAL inip_tb :    STD_LOGIC;
	SIGNAL inc_tb :    STD_LOGIC;
	SIGNAL inzero_tb :    STD_LOGIC;
	SIGNAL inone_tb :   STD_LOGIC;
	SIGNAL intwo_tb :    STD_LOGIC;
	SIGNAL inthree_tb :    STD_LOGIC;
	SIGNAL infour_tb :   STD_LOGIC;
	SIGNAL infive_tb :    STD_LOGIC;
	SIGNAL insix_tb :    STD_LOGIC;
	SIGNAL inseven_tb :    STD_LOGIC;
	SIGNAL ineight_tb :    STD_LOGIC;
	SIGNAL innine_tb :    STD_LOGIC;
	SIGNAL inten_tb :   STD_LOGIC;
	SIGNAL ineleven_tb :    STD_LOGIC;
	SIGNAL intwelve_tb :    STD_LOGIC;
	SIGNAL inthirteen_tb :    STD_LOGIC;
	SIGNAL infourteen_tb :    STD_LOGIC;
	SIGNAL infifteen_tb :   STD_LOGIC;
	SIGNAL dcse_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL deight_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL deleven_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dfifteen_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dfive_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dfour_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dfourteen_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dhi_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dip_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dlo_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dnine_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL done_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dpc_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dseven_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dsix_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dten_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dthirteen_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dthree_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dtwelve_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dtwo_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dzero_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dzhi_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL dzlo_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mdIn_tb :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL bmOut_tb :   STD_LOGIC_VECTOR(31 DOWNTO 0);
	
--component instantiation--
COMPONENT the_bus
	PORT(
		clr :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		wrt :  IN  STD_LOGIC;
		rd :  IN  STD_LOGIC;
		inhi :  IN  STD_LOGIC;
		inlo :  IN  STD_LOGIC;
		inzhi :  IN  STD_LOGIC;
		inzlo :  IN  STD_LOGIC;
		inpc :  IN  STD_LOGIC;
		inmdr :  IN  STD_LOGIC;
		inip :  IN  STD_LOGIC;
		inc :  IN  STD_LOGIC;
		inzero :  IN  STD_LOGIC;
		inone :  IN  STD_LOGIC;
		intwo :  IN  STD_LOGIC;
		inthree :  IN  STD_LOGIC;
		infour :  IN  STD_LOGIC;
		infive :  IN  STD_LOGIC;
		insix :  IN  STD_LOGIC;
		inseven :  IN  STD_LOGIC;
		ineight :  IN  STD_LOGIC;
		innine :  IN  STD_LOGIC;
		inten :  IN  STD_LOGIC;
		ineleven :  IN  STD_LOGIC;
		intwelve :  IN  STD_LOGIC;
		inthirteen :  IN  STD_LOGIC;
		infourteen :  IN  STD_LOGIC;
		infifteen :  IN  STD_LOGIC;
		dcse :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		deight :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		deleven :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dfifteen :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dfive :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dfour :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dfourteen :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dhi :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dip :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dlo :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dnine :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		done :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dpc :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dseven :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dsix :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dten :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dthirteen :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dthree :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dtwelve :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dtwo :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dzero :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dzhi :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dzlo :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mdIn :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		bmOut :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)

	);
END COMPONENT the_bus;

BEGIN
	DUT1 : the_bus
--port mapping: between DUT and testbench--
PORT MAP(
		clr => clr_tb ,
		clk => clk_tb ,
		wrt => wrt_tb ,
		rd => rd_tb ,
		inhi => inhi_tb ,
		inlo => inlo_tb ,
		inzhi => inzhi_tb ,
		inzlo => inzlo_tb ,
		inpc => inpc_tb ,
		inmdr => inmdr_tb ,
		inip => inip_tb ,
		inc => inc_tb ,
		inzero => inzero_tb ,
		inone => inone_tb ,
		intwo => intwo_tb ,
		inthree => inthree_tb ,
		infour => infour_tb ,
		infive => infive_tb ,
		insix => insix_tb ,
		inseven => inseven_tb ,
		ineight => ineight_tb ,
		innine => innine_tb ,
		inten => inten_tb ,
		ineleven => ineleven_tb ,
		intwelve => intwelve_tb ,
		inthirteen => inthirteen_tb ,
		infourteen => infourteen_tb ,
		infifteen => infifteen_tb ,
		dcse => dcse_tb ,
		deight => deight_tb ,
		deleven => deleven_tb ,
		dfifteen => dfifteen_tb ,
		dfive => dfive_tb ,
		dfour => dfour_tb ,
		dfourteen => dfourteen_tb ,
		dhi => dhi_tb ,
		dip => dip_tb ,
		dlo => dlo_tb ,
		dnine => dnine_tb ,
		done => done_tb ,
		dpc => dpc_tb ,
		dseven => dseven_tb ,
		dsix => dsix_tb ,
		dten => dten_tb ,
		dthirteen => dthirteen_tb ,
		dthree => dthree_tb ,
		dtwelve => dtwelve_tb ,
		dtwo => dtwo_tb ,
		dzero => dzero_tb ,
		dzhi => dzhi_tb ,
		dzlo => dzlo_tb ,
		mdIn => mdIn_tb ,
		bmOut => bmOut_tb);

	
--test logic--
sim_process : process

begin
	wait for 0 ns;
	clr_tb <= '0';
	rd_tb <= '1';
	clk_tb <= '0';
	wrt_tb <= '1';
	dzero_tb <= "00000000000000000000000000000001";
	inzero_tb <= '1';
	inone_tb <= '0';
	intwo_tb <= '0';
	inthree_tb <= '0';
	infour_tb <= '0';
	infive_tb <= '0';
	insix_tb <= '0';
	inseven_tb <= '0';
	ineight_tb <= '0';
	innine_tb <= '0';
	inten_tb <= '0';
	ineleven_tb <= '0';
	intwelve_tb <= '0';
	inthirteen_tb <= '0';
	infourteen_tb <= '0';
	infifteen_tb <= '0';
	inhi_tb <= '0';
	inlo_tb <= '0';
	inzhi_tb <= '0';
	inzlo_tb <= '0';
	inpc_tb <= '0';
	inmdr_tb <= '0';
	inip_tb <= '0';
	inc_tb <= '0';
	
	dcse_tb <= "00000000000000000000000000000001";
	deight_tb <= "00000000000000000000000000000001";
	deleven_tb <= "00000000000000000000000000000001";
	dfifteen_tb <= "00000000000000000000000000000001";
	dfive_tb <= "00000000000000000000000000000001";
	dfour_tb <= "00000000000000000000000000000001";
	dfourteen_tb <= "00000000000000000000000000000001";
	dhi_tb <= "00000000000000000000000000000001";
	dip_tb <= "00000000000000000000000000000001";
	dlo_tb <= "00000000000000000000000000000001";
	dnine_tb <= "00000000000000000000000000000001";
	done_tb <= "00000000000000000000000000000001";
	dpc_tb <= "00000000000000000000000000000001";
	dseven_tb <= "00000000000000000000000000000001";
	dsix_tb <= "00000000000000000000000000000001";
	dten_tb <= "00000000000000000000000000000001";
	dthirteen_tb <= "00000000000000000000000000000001";
	dthree_tb <= "00000000000000000000000000000001";
	dtwelve_tb <= "00000000000000000000000000000001";
	dtwo_tb <= "00000000000000000000000000000001";
	dzero_tb <= "00000001000000000000000000000001";
	dzhi_tb <= "00000000000000000000000000000001";
	dzlo_tb <= "00000000000000000000000000000001";
	mdIn_tb <= "00000000000000000000000000000001";
	wait for 25 ns;
	clk_tb <= '1';
	wait;
end process;
end;