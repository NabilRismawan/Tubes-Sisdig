library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cordic_arccos is
    Port (
        reset : in STD_LOGIC;
        clock : in STD_LOGIC;
        input_angle : in STD_LOGIC_VECTOR(15 downto 0);
        output_angle : out STD_LOGIC_VECTOR(15 downto 0)
    );
end cordic_arccos;

architecture Behavioral of cordic_arccos is

    component LUT_arctan
        Port (
            iterasi : in STD_LOGIC_VECTOR(3 downto 0);
            hasil : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal iterasi : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal hasil : STD_LOGIC_VECTOR(15 downto 0);
    signal y_o : STD_LOGIC_VECTOR(15 downto 0) := "1011011001000110"; -- 0.707 in Q1.15
    signal x_o : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; -- 0 in Q1.15
    signal theta_o : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; -- Initial angle
    signal shx, shy : STD_LOGIC_VECTOR(15 downto 0);
    signal theta : STD_LOGIC_VECTOR(15 downto 0);

begin

    LUT_arctan_inst: entity work.LUT_arctan
        port map(
            iterasi => iterasi,
            hasil => hasil
        );

    process(reset, clock)
        variable x : STD_LOGIC_VECTOR(15 downto 0);
        variable y : STD_LOGIC_VECTOR(15 downto 0);
        variable theta_var : STD_LOGIC_VECTOR(15 downto 0);
    begin
        if reset = '1' then
            y_o <= "1011011001000110"; -- Reset y_o to 0.707 (Q1.15 format)
            x_o <= "0000000000000000"; -- Reset x_o to 0
            theta_o <= "0000000000000000"; -- Reset theta_o to 0
            iterasi <= "0000"; -- Reset iteration counter
        elsif rising_edge(clock) then
            -- Shift right operations for x and y
            shx <= std_logic_vector(signed(x_o) srl to_integer(unsigned(iterasi)));
            shy <= std_logic_vector(signed(y_o) srl to_integer(unsigned(iterasi)));

            -- Perform the CORDIC rotation
            if y_o(15) = '0' then
                x_o <= std_logic_vector(signed(x_o) + signed(shy));
                y_o <= std_logic_vector(signed(y_o) - signed(shx));
                theta_o <= std_logic_vector(signed(theta_o) + signed(hasil));
            else
                x_o <= std_logic_vector(signed(x_o) - signed(shy));
                y_o <= std_logic_vector(signed(y_o) + signed(shx));
                theta_o <= std_logic_vector(signed(theta_o) - signed(hasil));
            end if;

            -- Increment iteration
            if iterasi < "1111" then
                iterasi <= std_logic_vector(unsigned(iterasi) + 1);
            else
                iterasi <= iterasi; -- Hold at maximum iteration
            end if;
        end if;
    end process;

    -- Assign final angle output
    output_angle <= theta_o;

end Behavioral;
