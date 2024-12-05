library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_tb is
end MUX_tb;

architecture behavior of MUX_tb is
  -- Component Declaration for the Unit Under Test (UUT)
  component MUX
    Port (
      digits : in STD_LOGIC_VECTOR(15 downto 0);
      clk : in STD_LOGIC;
      reset : in STD_LOGIC;
      cathode: out STD_LOGIC_VECTOR(0 to 6);
      anode: out STD_LOGIC_VECTOR(0 to 3)
    );
  end component;

  -- Signal Declarations
  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal digits : std_logic_vector(15 downto 0) := "0001001000110100"; -- Example digit input
  signal cathode : std_logic_vector(0 to 6);
  signal anode : std_logic_vector(0 to 3);

  -- Clock Period
  constant clk_period : time := 10 ns;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: MUX
    Port map (
      digits => digits,
      clk => clk,
      reset => reset,
      cathode => cathode,
      anode => anode
    );

  -- Clock Generation Process
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process;

  -- Stimulus Process
  stimulus_process : process
  begin
    -- Apply reset
    reset <= '1';
    wait for clk_period * 2;
    reset <= '0';

    -- Wait for several clock periods to observe all digits and anodes
    wait for clk_period * 100;

    -- Finish the simulation
    assert false report "End of simulation" severity failure;
  end process;

  -- Monitoring Process (Optional)
  -- This process will print the anode and cathode values whenever they change

end behavior;