library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi entitas Multiple
entity Multiple is
    Port (
        input_a : in  std_logic_vector(15 downto 0); -- Input pertama (16-bit)
        input_b : in  std_logic_vector(15 downto 0); -- Input kedua (16-bit)
        output_c: out std_logic_vector(31 downto 0)  -- Output hasil perkalian (32-bit)
    );
end Multiple;

-- Arsitektur untuk implementasi logika perkalian
architecture Behavioral of Multiple is
begin
    -- Proses utama untuk menghitung hasil perkalian
    process(input_a, input_b)
        variable result : unsigned(31 downto 0); -- Variabel sementara untuk hasil perkalian
    begin
        -- Perkalian input_a dan input_b
        -- Konversi input ke unsigned sebelum dilakukan perkalian
        result := unsigned(input_a) * unsigned(input_b);

        -- Hasil penuh (32-bit) langsung diberikan ke output_c
        output_c <= std_logic_vector(result); -- Konversi kembali ke std_logic_vector
    end process;
end Behavioral;
