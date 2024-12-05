library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MUX is
  Port (
    digits : in STD_LOGIC_VECTOR(0 to 15);
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    cathode: out STD_LOGIC_VECTOR(0 to 6);
    anode: out STD_LOGIC_VECTOR(0 to 3)
  );
end MUX;

architecture Behavioral of MUX is
  component Seven_Segment
    Port (
      input : in STD_LOGIC_VECTOR(0 to 3);
      cathode : out STD_LOGIC_VECTOR(0 to 6)
    );
  end component;

  component Timer
    Port (
      clk : in std_logic;
      reset : in std_logic;
      new_clk : out std_logic;
      sel : out std_logic_vector(1 downto 0)
    );
  end component;

  -- Internal Signals
  signal new_clk : std_logic;
  signal sel : std_logic_vector(1 downto 0);
  signal selected_digit : std_logic_vector(0 to 3);

begin
  -- Instantiate the Timer Component
  timer_inst : Timer
    Port map (
      clk => clk,
      reset => reset,
      new_clk => new_clk,
      sel => sel
    );

  -- MUX Logic: Select the digit based on the sel value
  process(sel)
  begin
    case sel is
      when "00" =>
        selected_digit <= digits(0 to 3);
        anode <= "0111";  -- Activate first digit (anode 0)
      when "01" =>
        selected_digit <= digits(4 to 7);
        anode <= "1011";  -- Activate second digit (anode 1)
      when "10" =>
        selected_digit <= digits(8 to 11);
        anode <= "1101";  -- Activate third digit (anode 2)
      when "11" =>
        selected_digit <= digits(12 to 15);
        anode <= "1110";  -- Activate fourth digit (anode 3)
      when others =>
        selected_digit <= "0000"; -- Default case
        anode <= "1111";  -- Deactivate all anodes
    end case;
  end process;

  -- Instantiate the Seven_Segment Component
  seven_segment_inst : Seven_Segment
    Port map (
      input => selected_digit,
      cathode => cathode
    );

end Behavioral;
