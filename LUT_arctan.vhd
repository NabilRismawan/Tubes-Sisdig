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
        process (i)
        -- hasil = fix point 16 bit
        begin
            if i = 0 then
                hasil <= x"FFFF"; -- 45.00 derajat
            elsif i = 1 then
                hasil <= x"FFFF"; -- 26.565 derajat
            elsif i = 2 then
                hasil <= x"FFFF"; -- 14.036 derajat
            elsif i = 3 then
                hasil <= x"FFFF"; -- 7.125 derajat
            elsif i = 4 then
                hasil <= x"FFFF"; -- 3.576 derajat
            elsif i = 5 then
                hasil <= x"FFFF"; -- 1.789 derajat
            elsif i = 6 then
                hasil <= x"E4BF"; -- 0.895 derajat
            elsif i = 7 then
                hasil <= x"725F"; -- 0.447 derajat
            elsif i = 8 then
                hasil <= x"3907"; -- 0.223 derajat
            elsif i = 9 then
                hasil <= x"1C6A"; -- 0.111 derajat
            elsif i = 10 then
                hasil <= x"0E14"; -- 0.055 derajat
            elsif i = 11 then
                hasil <= x"06E9"; -- 0.027 derajat
            elsif i = 12 then
                hasil <= x"0354"; -- 0.013 derajat
            elsif i = 13 then
                hasil <= x"0189"; -- 0.006 derajat
            elsif i = 14 then
                hasil <= x"00C5"; -- 0.003 derajat
            elsif i = 15 then
                hasil <= x"0042"; -- 0.001 derajat
            end if;
        end process;
    end LUT;