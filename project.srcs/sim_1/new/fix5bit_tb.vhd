library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fix5bit_tb is
end fix5bit_tb;

architecture Behavioral of fix5bit_tb is
    -- Test signals
    signal S_tb      : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_tb   : STD_LOGIC;
    signal S_out_tb  : STD_LOGIC_VECTOR(3 downto 0);
    signal LedDec_tb : STD_LOGIC;
    
    -- Component declaration
    component fix5bit is
        Port (
            S      : in  STD_LOGIC_VECTOR(3 downto 0);
            Cout   : in  STD_LOGIC;
            S_out  : out STD_LOGIC_VECTOR(3 downto 0);
            LedDec : out STD_LOGIC
        );
    end component;
    
begin
    -- Component instantiation
    UUT: fix5bit
        port map (
            S      => S_tb,
            Cout   => Cout_tb,
            S_out  => S_out_tb,
            LedDec => LedDec_tb
        );
        
    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Normal operation (Cout = 0)
        S_tb <= "1010";
        Cout_tb <= '0';
        wait for 10 ns;
        
        -- Test Case 2: Number 16 (should output 6)
        S_tb <= "0000";
        Cout_tb <= '1';
        wait for 10 ns;
        
        -- Test Case 3: Number 17 (should output 7)
        S_tb <= "0001";
        Cout_tb <= '1';
        wait for 10 ns;
        
        -- Test Case 4: Number 18 (should output 8)
        S_tb <= "0010";
        Cout_tb <= '1';
        wait for 10 ns;
        
        -- Test Case 5: Random case
        S_tb <= "1111";
        Cout_tb <= '1';
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process;
    
end Behavioral;