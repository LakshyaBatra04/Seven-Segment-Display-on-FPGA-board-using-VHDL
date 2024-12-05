library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seven_Segment is 
    Port (
        input : in STD_LOGIC_VECTOR(0 to 3);
        cathode : out STD_LOGIC_VECTOR(0 to 6)
    );
end Seven_Segment;

architecture Behavioral of Seven_Segment is
begin
    -- Segment a (cathode(6))
    cathode(6) <= not(not(input(2) or input(0)) or (not input(3) and input(1)) or (input(2) and input(1)) or (input(3) and not input(0)) or (not input(3) and input(2) and input(0)) or (input(3) and (not input(1)) and (not input(2))));

    -- Segment b (cathode(5))
    cathode(5) <= not(not(input(3) or input(2)) or (not input(2) and not input(0)) or (not input(3) and not input(1) and not input(0)) or (not input(3) and input(1) and input(0)) or (input(3) and not input(1) and input(0)));

    -- Segment c (cathode(4))
    cathode(4) <= not((not input(3) and not input(1)) or (not input(3) and input(0)) or (not input(1) and input(0)) or (not input(3) and input(2)) or (input(3) and not input(2)));

    -- Segment d (cathode(3))
    cathode(3) <= not((input(3) and not input(1)) or (not (input(3) or input(2) or input(0))) or ((not input(2)) and input(1) and input(0)) or (input(2) and not input(1) and input(0)) or (input(2) and input(1) and not input(0)));

    -- Segment e (cathode(2))
    cathode(2) <= not(not(input(2) or input(0)) or (input(1) and not input(0)) or (input(3) and input(1)) or (input(3) and input(2)));

    -- Segment f (cathode(1))
    cathode(1) <= not(not(input(1) or input(0)) or (input(2) and not input(0)) or (input(3) and not input(2)) or (input(3) and input(1)) or (not input(3) and input(2) and not input(1)));

    -- Segment g (cathode(0))
    cathode(0) <= not((not input(2) and input(1)) or (input(1) and not input(0)) or (input(3) and not input(2)) or (input(3) and input(0)) or (not input(3) and input(2) and not input(1)));
end Behavioral;
