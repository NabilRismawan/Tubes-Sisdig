library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FloatingPointDivideBy2 is
    Port (
        input_val  : in  std_logic_vector(31 downto 0);
        output_val : out std_logic_vector(31 downto 0)
    );
end FloatingPointDivideBy2;

architecture Behavioral of FloatingPointDivideBy2 is
begin
    process(input_val)
        variable sign_bit     : std_logic;
        variable exponent     : unsigned(7 downto 0);
        variable mantissa     : std_logic_vector(22 downto 0);
        variable new_exponent : unsigned(7 downto 0);
        variable new_mantissa : std_logic_vector(22 downto 0);
        variable extended_mantissa : std_logic_vector(23 downto 0); -- Include hidden bit
    begin
        -- Ekstrak komponen
        sign_bit := input_val(31);
        exponent := unsigned(input_val(30 downto 23));
        mantissa := input_val(22 downto 0);
        
        -- Tambahkan hidden bit '1' untuk extended_mantissa
        extended_mantissa := '1' & mantissa;
        
        -- Jika bit ke-23 (hidden bit) atau bit ke-22 dari extended_mantissa adalah '1'
        -- maka mantissa tetap sama
        -- jika tidak, kemungkinan mantissa perlu berubah
        if extended_mantissa(23) = '1' or extended_mantissa(22) = '1' then
            new_mantissa := mantissa;
            new_exponent := exponent - 1;
        else
            -- Geser mantissa left 1 bit dan hilangkan hidden bit
            new_mantissa := mantissa(21 downto 0) & '0';
            new_exponent := exponent - 1;
        end if;

        -- Output hasil
        output_val <= sign_bit & std_logic_vector(new_exponent) & new_mantissa;
    end process;
end Behavioral;