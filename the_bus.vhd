-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sun Feb 23 02:44:12 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY the_bus IS 
	PORT
	(
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
END the_bus;

ARCHITECTURE bdf_type OF the_bus IS 

COMPONENT bidirectional_bus
	PORT(bmeight : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmeleven : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfifteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfive : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfour : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfourteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmHI : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmIP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmLO : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmMDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmnine : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmone : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmPC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmseven : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmsix : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmten : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmthirteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmthree : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmtwelve : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmtwo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmzero : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmZHIGH : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmZLOW : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cSE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 eIN : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 bmOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT bus_encoder
	PORT(zeror : IN STD_LOGIC;
		 oner : IN STD_LOGIC;
		 twor : IN STD_LOGIC;
		 threer : IN STD_LOGIC;
		 fourr : IN STD_LOGIC;
		 fiver : IN STD_LOGIC;
		 sixr : IN STD_LOGIC;
		 sevenr : IN STD_LOGIC;
		 eightr : IN STD_LOGIC;
		 niner : IN STD_LOGIC;
		 tenr : IN STD_LOGIC;
		 elevenr : IN STD_LOGIC;
		 twelver : IN STD_LOGIC;
		 thirteenr : IN STD_LOGIC;
		 fourteenr : IN STD_LOGIC;
		 fifteenr : IN STD_LOGIC;
		 hiOUT : IN STD_LOGIC;
		 loOUT : IN STD_LOGIC;
		 zhighOUT : IN STD_LOGIC;
		 zlowOUT : IN STD_LOGIC;
		 pcOUT : IN STD_LOGIC;
		 mdrOUT : IN STD_LOGIC;
		 ipOUT : IN STD_LOGIC;
		 cOUT : IN STD_LOGIC;
		 eOUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_one
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr_mux
	PORT(RD : IN STD_LOGIC;
		 bmOUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdataIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
bmOut <= SYNTHESIZED_WIRE_26;



b2v_bus : bidirectional_bus
PORT MAP(bmeight => SYNTHESIZED_WIRE_0,
		 bmeleven => SYNTHESIZED_WIRE_1,
		 bmfifteen => SYNTHESIZED_WIRE_2,
		 bmfive => SYNTHESIZED_WIRE_3,
		 bmfour => SYNTHESIZED_WIRE_4,
		 bmfourteen => SYNTHESIZED_WIRE_5,
		 bmHI => SYNTHESIZED_WIRE_6,
		 bmIP => SYNTHESIZED_WIRE_7,
		 bmLO => SYNTHESIZED_WIRE_8,
		 bmMDR => SYNTHESIZED_WIRE_9,
		 bmnine => SYNTHESIZED_WIRE_10,
		 bmone => SYNTHESIZED_WIRE_11,
		 bmPC => SYNTHESIZED_WIRE_12,
		 bmseven => SYNTHESIZED_WIRE_13,
		 bmsix => SYNTHESIZED_WIRE_14,
		 bmten => SYNTHESIZED_WIRE_15,
		 bmthirteen => SYNTHESIZED_WIRE_16,
		 bmthree => SYNTHESIZED_WIRE_17,
		 bmtwelve => SYNTHESIZED_WIRE_18,
		 bmtwo => SYNTHESIZED_WIRE_19,
		 bmzero => SYNTHESIZED_WIRE_20,
		 bmZHIGH => SYNTHESIZED_WIRE_21,
		 bmZLOW => SYNTHESIZED_WIRE_22,
		 cSE => SYNTHESIZED_WIRE_23,
		 eIN => SYNTHESIZED_WIRE_24,
		 bmOUT => SYNTHESIZED_WIRE_26);


b2v_busenc : bus_encoder
PORT MAP(zeror => inzero,
		 oner => inone,
		 twor => intwo,
		 threer => inthree,
		 fourr => infour,
		 fiver => infive,
		 sixr => insix,
		 sevenr => inseven,
		 eightr => ineight,
		 niner => innine,
		 tenr => inten,
		 elevenr => ineleven,
		 twelver => intwelve,
		 thirteenr => inthirteen,
		 fourteenr => infourteen,
		 fifteenr => infifteen,
		 hiOUT => inhi,
		 loOUT => inlo,
		 zhighOUT => inzhi,
		 zlowOUT => inzlo,
		 pcOUT => inpc,
		 mdrOUT => inmdr,
		 ipOUT => inip,
		 cOUT => inc,
		 eOUT => SYNTHESIZED_WIRE_24);


b2v_cse : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dcse,
		 Q => SYNTHESIZED_WIRE_23);


b2v_hi : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dhi,
		 Q => SYNTHESIZED_WIRE_6);


b2v_ip : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dip,
		 Q => SYNTHESIZED_WIRE_7);


b2v_low : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dlo,
		 Q => SYNTHESIZED_WIRE_8);


b2v_mdr : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => SYNTHESIZED_WIRE_25,
		 Q => SYNTHESIZED_WIRE_9);


b2v_mdrmux : mdr_mux
PORT MAP(RD => rd,
		 bmOUT => SYNTHESIZED_WIRE_26,
		 mdataIN => mdIn,
		 mdOUT => SYNTHESIZED_WIRE_25);


b2v_pc : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dpc,
		 Q => SYNTHESIZED_WIRE_12);


b2v_reg1 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dzero,
		 Q => SYNTHESIZED_WIRE_20);


b2v_reg10 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dnine,
		 Q => SYNTHESIZED_WIRE_10);


b2v_reg11 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dten,
		 Q => SYNTHESIZED_WIRE_15);


b2v_reg12 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => deleven,
		 Q => SYNTHESIZED_WIRE_1);


b2v_reg13 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dtwelve,
		 Q => SYNTHESIZED_WIRE_18);


b2v_reg14 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dthirteen,
		 Q => SYNTHESIZED_WIRE_16);


b2v_reg15 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dfourteen,
		 Q => SYNTHESIZED_WIRE_5);


b2v_reg16 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dfifteen,
		 Q => SYNTHESIZED_WIRE_2);


b2v_reg2 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => done,
		 Q => SYNTHESIZED_WIRE_11);


b2v_reg3 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dtwo,
		 Q => SYNTHESIZED_WIRE_19);


b2v_reg4 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dthree,
		 Q => SYNTHESIZED_WIRE_17);


b2v_reg5 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dfour,
		 Q => SYNTHESIZED_WIRE_4);


b2v_reg6 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dfive,
		 Q => SYNTHESIZED_WIRE_3);


b2v_reg7 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dsix,
		 Q => SYNTHESIZED_WIRE_14);


b2v_reg8 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dseven,
		 Q => SYNTHESIZED_WIRE_13);


b2v_reg9 : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => deight,
		 Q => SYNTHESIZED_WIRE_0);


b2v_zhi : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dzhi,
		 Q => SYNTHESIZED_WIRE_21);


b2v_zlow : reg_one
PORT MAP(CLR => clr,
		 CLK => clk,
		 WRT => wrt,
		 D => dzlo,
		 Q => SYNTHESIZED_WIRE_22);


END bdf_type;