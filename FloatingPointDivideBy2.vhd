library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi entitas FloatingPointDivideBy2
entity FloatingPointDivideBy2 is
    Port (
        input_val  : in  std_logic_vector(31 downto 0); -- Nilai input floating-point 32-bit
        output_val : out std_logic_vector(31 downto 0)  -- Nilai output floating-point 32-bit setelah dibagi 2
    );
end FloatingPointDivideBy2;

-- Arsitektur modul
architecture Behavioral of FloatingPointDivideBy2 is
begin
    process(input_val)
        variable sign_bit   : std_logic;              -- Bit tanda
        variable exponent   : unsigned(7 downto 0);   -- Eksponen
        variable mantissa   : std_logic_vector(22 downto 0); -- Mantissa
        variable new_exponent : unsigned(7 downto 0); -- Eksponen baru setelah dikurangi 1
    begin
        -- Pisahkan bit tanda, eksponen, dan mantissa
        sign_bit := input_val(31); -- Bit tanda
        exponent := unsigned(input_val(30 downto 23)); -- Eksponen
        mantissa := input_val(22 downto 0); -- Mantissa

        -- Kurangi eksponen sebesar 1 untuk membagi dua
        new_exponent := exponent - 1;

        -- Rekonstruksi output dalam format floating-point IEEE 754
        output_val <= sign_bit & std_logic_vector(new_exponent) & mantissa;
    end process;
end Behavioral;
