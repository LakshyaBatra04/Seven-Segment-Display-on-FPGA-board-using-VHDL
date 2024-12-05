library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer_tb is
end Timer_tb;

architecture behavior of Timer_tb is
  component Timer
    Port (
      clk : in std_logic;
      reset : in std_logic;
      new_clk : out std_logic;
      sel : out std_logic_vector(1 downto 0)
    );
  end component;

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal new_clk : std_logic;
  signal sel : std_logic_vector(1 downto 0);

  constant clk_period : time := 10 ns;

begin
  uut: Timer
    Port map (
      clk => clk,
      reset => reset,
      new_clk => new_clk,
      sel => sel
    );

  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process;

  stimulus_process : process
  begin
    reset <= '1';
    wait for clk_period * 2;
    reset <= '0';

    wait for clk_period * 100;

    -- Finish the simulation
    assert false report "End of simulation" severity failure;
  end process;




end behavior;
 