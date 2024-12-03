LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipflop IS
PORT (
    D     : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- 32-bit input
    Clock : IN STD_LOGIC;
    Q     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- 32-bit output
);
END flipflop;

ARCHITECTURE Behavior OF flipflop IS
BEGIN
    PROCESS (Clock)
    BEGIN
        IF Clock'EVENT AND Clock = '1' THEN
            Q <= D; -- Assign the 32-bit input to the output
        END IF;
    END PROCESS;
END Behavior;
