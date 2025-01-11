library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FloatingPointDivideBy4 is
    Port (
        input_val  : in  std_logic_vector(31 downto 0);
        output_val : out std_logic_vector(31 downto 0)
    );
end FloatingPointDivideBy4;

architecture Behavioral of FloatingPointDivideBy4 is
begin
    process(input_val)
        variable exponent : unsigned(7 downto 0);
    begin
        -- Kurangi exponent dengan 2 (sama dengan membagi dengan 4)
        -- Mantissa tetap sama karena pembagian dengan 4 hanya mempengaruhi exponent
        exponent := unsigned(input_val(30 downto 23)) - 2;
        
        -- Output: sign bit tetap sama, exponent baru, mantissa tetap sama
        output_val <= input_val(31) & std_logic_vector(exponent) & input_val(22 downto 0);
    end process;
end Behavioral;