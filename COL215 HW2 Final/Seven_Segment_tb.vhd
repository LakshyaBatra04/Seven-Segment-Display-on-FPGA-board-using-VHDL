library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seven_Segment_tb is
end Seven_Segment_tb;

architecture Behavioral of Seven_Segment_tb is

component Seven_Segment
    Port(
        input : in STD_LOGIC_VECTOR(0 to 3);
        cathode : out STD_LOGIC_VECTOR(0 to 6)
    );
end component;

signal tb_input : STD_LOGIC_VECTOR(0 to 3);
signal tb_cathode : STD_LOGIC_VECTOR(0 to 6);

begin

uut: Seven_Segment
    Port map (
        input => tb_input,
        cathode => tb_cathode
);

-- Test process
process
begin
    -- Test 0
    tb_input <= "0000";
    wait for 10 ns;
    -- Test 1
    tb_input <= "0001";
    wait for 10 ns;
    -- Test 2
    tb_input <= "0010";
    wait for 10 ns;
    -- Test 3
    tb_input <= "0011";
    wait for 10 ns;
    -- Test 4
    tb_input <= "0100";
    wait for 10 ns;
    -- Test 5
    tb_input <= "0101";
    wait for 10 ns;
    -- Test 6
    tb_input <= "0110";
    wait for 10 ns;
    -- Test 7
    tb_input <= "0111";
    wait for 10 ns;
    -- Test 8
    tb_input <= "1000";
    wait for 10 ns;
    -- Test 9
    tb_input <= "1001";
    wait for 10 ns;
    -- Test A
    tb_input <= "1010";
    wait for 10 ns;
    -- Test B
    tb_input <= "1011";
    wait for 10 ns;
    -- Test C
    tb_input <= "1100";
    wait for 10 ns;
    -- Test D
    tb_input <= "1101";
    wait for 10 ns;
    -- Test E
    tb_input <= "1110";
    wait for 10 ns;
    -- Test F
    tb_input <= "1111";
    wait for 10 ns;
    
wait;
end process;
end Behavioral;
