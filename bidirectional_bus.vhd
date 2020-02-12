LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bidirectional_bus IS
	PORT(
	bm0, bm1, bm2, bm3, bm4, bm5, bm6, bm7, bm8, bm9, bm10, bm11, bm12, bm13, bm14, bm15,
	bmHI, bmLO, bmZHIGH, bmZLOW, bmPC, bmMDR, bmIP, cSE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	eIN : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	bmOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END bidirectional_bus;

ARCHITECTURE behavioral OF bidirectional_bus IS
BEGIN
	BUSMUX:
	PROCESS(bm0, bm1, bm2, bm3, bm4, bm5, bm6, bm7, bm8, bm9, bm10, bm11, bm12, bm13, bm14, bm15,
	bmHI, bmLO, bmZHIGH, bmZLOW, bmPC, bmMDR, bmIP, cSE, eIN)
	BEGIN
		CASE eIN IS
			when "00000" => bmOUT <= bm0;
			when "00001" => bmOUT <= bm1;
			when "00010" => bmOUT <= bm2;
			when "00011" => bmOUT <= bm3;
			when "00100" => bmOUT <= bm4;
			when "00101" => bmOUT <= bm5;
			when "00110" => bmOUT <= bm6;
			when "00111" => bmOUT <= bm7;
			when "01000" => bmOUT <= bm8;
			when "01001" => bmOUT <= bm9;
			when "01010" => bmOUT <= bm10;
			when "01011" => bmOUT <= bm11;
			when "01100" => bmOUT <= bm12;
			when "01101" => bmOUT <= bm13;
			when "01110" => bmOUT <= bm14;
			when "01111" => bmOUT <= bm15;
			when "10000" => bmOUT <= bmHI;
			when "10001" => bmOUT <= bmLO;
			when "10010" => bmOUT <= bmZHIGH;
			when "10011" => bmOUT <= bmZLOW;
			when "10100" => bmOUT <= bmPC;
			when "10101" => bmOUT <= bmMDR;
			when "10110" => bmOUT <= bmIP;
			when "10111" => bmOUT <= cSE;
			when 	others =>
			
		END CASE;
	END PROCESS;
END behavioral;
		
			