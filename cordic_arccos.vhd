library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity cordic_arccos is
    generic (
        ITERATIONS : integer := 16; -- Number of iterations
        WIDTH      : integer := 16  -- Fixed-point width
    );
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        cos_in   : in  signed(WIDTH-1 downto 0); -- Input cosine value
        angle_out: out signed(WIDTH-1 downto 0)  -- Output angle
    );
end entity cordic_arccos;

architecture Behavioral of cordic_arccos is

    -- Declare real_vector type
    type real_vector is array (natural range <>) of real;

    -- Precomputed arctangent values in degrees
    constant ANGLE_TABLE : real_vector(0 to ITERATIONS-1) := (
        45.0, 26.5650512, 14.0362435, 7.12501635,
        3.57633437, 1.78991061, 0.89517371, 0.44761417,
        0.2238105,  0.1119057,  0.0559528,  0.0279764,
        0.0139882,  0.0069941,  0.003497,   0.0017485
    );

    -- Function to convert real to fixed-point signed
    function real_to_fixed(value : real; bits : integer) return signed is
        variable fixed_val : integer;
    begin
        fixed_val := integer(value * (2.0 ** (bits-1)));
        return to_signed(fixed_val, bits);
    end function;

    signal x, y, z : signed(WIDTH-1 downto 0); -- Vector components and angle
    signal iteration : integer := 0;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            x <= cos_in;           -- Initialize x to input cosine
            y <= to_signed(0, WIDTH); -- Initialize y to zero
            z <= to_signed(0, WIDTH); -- Initialize accumulated angle to zero
            iteration <= 0;
        elsif rising_edge(clk) then
            if iteration < ITERATIONS then
                if x(WIDTH-1) = '1' then -- If x < 0, rotate up
                    x <= x + (y srl iteration); -- x += y >> iteration
                    y <= y - (x srl iteration); -- y -= x >> iteration
                    z <= z - real_to_fixed(ANGLE_TABLE(iteration), WIDTH);
                else -- Rotate down
                    x <= x - (y srl iteration); -- x -= y >> iteration
                    y <= y + (x srl iteration); -- y += x >> iteration
                    z <= z + real_to_fixed(ANGLE_TABLE(iteration), WIDTH);
                end if;
                iteration <= iteration + 1;
            else
                angle_out <= z; -- Output final angle
            end if;
        end if;
    end process;
end Behavioral;
