-- Ini adalah fungsi look up table dari arctan

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LUT_arctan IS
    PORT(
    iterasi : IN STD_LOGIC_VECTOR (3 downto 0);
    hasil : OUT STD_LOGIC_VECTOR (15 downto 0)
    );
END LUT_arctan;


-- arctan (2**(-i)) for i in range 15
-- hasil dari arctan (2**(-i)) dengan iterasi sebanyak 16 kali
Architecture LUT OF LUT_arctan IS 
BEGIN
PROCESS (iterasi)
	BEGIN
        CASE iterasi IS
            WHEN "0000" =>
                hasil <= x"FFFF"; -- 45.00 derajat
            when "0001" =>
                hasil <= x"FFFF"; -- 26.565 derajat
            WHEN "0010" =>
                hasil <= x"FFFF"; -- 14.036 derajat
            WHEN "0011" =>
                hasil <= x"FFFF"; -- 7.125 derajat
            WHEN "0100" =>
                hasil <= x"FFFF"; -- 3.576 derajat
            WHEN "0101" =>
                hasil <= x"FFFF"; -- 1.789 derajat
            WHEN "0110" =>
                hasil <= x"E4BF"; -- 0.895 derajat
            WHEN "0111" =>
                hasil <= x"725F"; -- 0.447 derajat
            WHEN "1000" =>
                hasil <= x"3907"; -- 0.223 derajat
            WHEN "1001" =>
                hasil <= x"1C6A"; -- 0.111 derajat
            WHEN "1010" =>
                hasil <= x"0E14"; -- 0.055 derajat
            WHEN "1011" =>
                hasil <= x"06E9"; -- 0.027 derajat
            WHEN "1100" =>
                hasil <= x"0354"; -- 0.013 derajat
            WHEN "1101" =>
                hasil <= x"0189"; -- 0.006 derajat
            WHEN "1110" =>
                hasil <= x"00C5"; -- 0.003 derajat
            WHEN "1111" =>
                hasil <= x"0042"; -- 0.001 derajat
        END CASE;
    END PROCESS;
END LUT;