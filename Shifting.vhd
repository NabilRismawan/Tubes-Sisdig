library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi entitas Shifting
entity Shifting is
    Port (
        input_val  : in  std_logic_vector(31 downto 0); -- Nilai input 32-bit
        output_val : out std_logic_vector(31 downto 0)  -- Nilai output 32-bit
    );
end Shifting;

-- Arsitektur modul
architecture Behavioral of Shifting is
begin
    -- Lakukan operasi shifting ke kanan 
    output_val <= '0' & input_val(31 downto 1); -- Geser ke kanan, tambahkan '0' di kiri
end Behavioral;
