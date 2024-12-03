library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi entitas Shifting
entity multiplytwo is
    Port (
        input_val  : in  std_logic_vector(31 downto 0); -- Nilai input 32-bit
        output_val : out std_logic_vector(31 downto 0)  -- Nilai output 32-bit
    );
end multiplytwo;

-- Arsitektur modul
architecture Behavioral of multiplytwo is
begin
    -- Lakukan operasi shifting ke kanan 
    output_val <=  input_val(30 downto 0) & '0'; -- Geser ke kiri, tambahkan '0' di kanan
end Behavioral;