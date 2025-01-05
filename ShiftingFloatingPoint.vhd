library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi entitas ShiftingFloatingPoint
entity ShiftingFloatingPoint is
    Port (
        input_val  : in  std_logic_vector(31 downto 0); -- Nilai input 32-bit
        output_val : out std_logic_vector(31 downto 0)  -- Nilai output 32-bit setelah pergeseran
    );
end ShiftingFloatingPoint;

-- Arsitektur modul
architecture Behavioral of ShiftingFloatingPoint is
begin
    process(input_val)
    begin
        -- Bit tanda tetap di posisinya
        output_val(31) <= input_val(31);

        -- Bit kosong (30-29) diisi dengan '0'
        output_val(30 downto 29) <= (others => '0');

        -- Eksponen dan mantissa (28-0) bergeser ke kanan 2 posisi
        output_val(28 downto 0) <= input_val(30 downto 2);
    end process;
end Behavioral;
