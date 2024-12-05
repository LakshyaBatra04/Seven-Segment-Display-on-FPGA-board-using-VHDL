library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Timer is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        new_clk : out std_logic; 
        sel : out std_logic_vector(1 downto 0)
    );
end Timer;

architecture Behavioral of Timer is
    constant N : integer := 50000; 
    signal counter : integer range 0 to N := 0;
    signal sel_counter : unsigned(1 downto 0) := (others => '0'); 
    signal internal_new_clk : std_logic := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            internal_new_clk <= '0'; 
            sel_counter <= (others => '0');
        elsif rising_edge(clk) then
            if counter = N then
                counter <= 0;
                internal_new_clk <= not internal_new_clk;
                sel_counter <= sel_counter + 1; 
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    new_clk <= internal_new_clk; 
    sel <= std_logic_vector(sel_counter); 
end Behavioral;
