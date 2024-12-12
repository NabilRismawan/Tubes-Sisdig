LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity cordic_arccos is
    port (
        enable : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		Xinput : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		done : OUT STD_LOGIC;
		Zoutput : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
end entity cordic_arccos;

architecture Behavioral of cordic_arccos is
    COMPONENT LUT_arctan IS 
        PORT (
        iterasi : IN STD_LOGIC_VECTOR (3 downto 0);
        hasil : OUT STD_LOGIC_VECTOR (15 downto 0)
        );
    END component;

BEGIN
    LUT_arctan_inst: entity work.LUT_arctan
     port map(
        iterasi => iterasi,
        hasil => hasil
    );
	process( rst, clk ) 
	variable x: std_logic_vector (15 downto 0);   
	variable y: std_logic_vector (15 downto 0);
	variable y_o: std_logic_vector (15 downto 0) := "1011011001000110"; -- nilai awal sumbu y
	variable x_o: std_logic_vector (15 downto 0) := "0000000000000000"; -- nilai awal sumbu x
	variable theta: std_logic_vector (15 downto 0);
	variable theta_o: std_logic_vector (15 downto 0) := "0000000000000000"; -- nilai awal theta (yang akan menjadi keluaran sudut)
	variable shx: std_logic_vector (15 downto 0); 
	variable shy: std_logic_vector (15 downto 0);
	
	begin
        if( rst = '1' ) then
            y_o := "1011011001000110";
            x_o := "0000000000000000";
            theta_o := "0000000000000000";
        elsif( clk'event and clk = '1' ) then
            if iterasi < 10 then
                    
                if iterasi = 0 then
                    if (x_o < x_in) then
                        y := y_o - x_o;
                        x := x_o + y_o;
                        theta := theta_o + nilai_out;
                    else
                        y := y_o + x_o;
                        x := x_o - y_o;
                        theta := theta_o - nilai_out;
                    end if;
                    
                elsif iterasi = 1 then
                    shx (15 downto 0) := "0" & x (15 downto 1);
                    shy (15 downto 0) := "0" & y (15 downto 1);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;
                    
                elsif iterasi = 2 then
                    shx (15 downto 0) := "00" & x (15 downto 2);
                    shy (15 downto 0) := "00" & y (15 downto 2);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 3 then
                    shx (15 downto 0) := "000" & x (15 downto 3);
                    shy (15 downto 0) := "000" & y (15 downto 3);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 4 then
                    shx (15 downto 0) := "0000" & x (15 downto 4);
                    shy (15 downto 0) := "0000" & y (15 downto 4);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 5 then
                    shx (15 downto 0) := "00000" & x (15 downto 5);
                    shy (15 downto 0) := "00000" & y (15 downto 5);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 6 then
                    shx (15 downto 0) := "000000" & x (15 downto 6);
                    shy (15 downto 0) := "000000" & y (15 downto 6);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 7 then
                    shx (15 downto 0) := "0000000" & x (15 downto 7);
                    shy (15 downto 0) := "0000000" & y (15 downto 7);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 8 then
                    shx (15 downto 0) := "00000000" & x (15 downto 8);
                    shy (15 downto 0) := "00000000" & y (15 downto 8);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 9 then
                    shx (15 downto 0) := "000000000" & x (15 downto 9);
                    shy (15 downto 0) := "000000000" & y (15 downto 9);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;

                elsif iterasi = 10 then
                    shx (15 downto 0) := "0000000000" & x (15 downto 10);
                    shy (15 downto 0) := "0000000000" & y (15 downto 10);
                    if (x < x_in) then
                        y := y - shx;
                        x := x + shy;
                        theta := theta + nilai_out;
                    else
                        y := y + shx;
                        x := x - shy;
                        theta := theta - nilai_out;
                    end if;
                
                end if;
            
                iterasi <= iterasi + 1;

            end if;

            sudut <= "1011010000000000" - theta;

            else
            end if;

        end process;

    end sim;
end Behavioral;
