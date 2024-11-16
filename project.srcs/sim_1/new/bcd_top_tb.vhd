library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_top_tb is
end bcd_top_tb;

architecture sim of bcd_top_tb is
    -- Component Declaration
    component bcd_top is
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            A_out : out STD_LOGIC_VECTOR(3 downto 0);
            B_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    -- Signal Declaration
    signal A_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal B_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal A_out_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal B_out_tb : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    -- Component Instantiation
    uut: bcd_top 
    port map (
        A => A_tb,
        B => B_tb,
        A_out => A_out_tb,
        B_out => B_out_tb
    );
    
    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: Both inputs valid (5 and 7)
        A_tb <= "0101";  -- 5
        B_tb <= "0111";  -- 7
        wait for 10 ns;
        report "Test 1 - A=5, B=7";
        report "A_out = " & integer'image(to_integer(unsigned(A_out_tb)));
        report "B_out = " & integer'image(to_integer(unsigned(B_out_tb)));
        
        -- Test 2: A valid, B invalid (3 and 12)
        A_tb <= "0011";  -- 3
        B_tb <= "1100";  -- 12
        wait for 10 ns;
        report "Test 2 - A=3, B=12";
        report "A_out = " & integer'image(to_integer(unsigned(A_out_tb)));
        report "B_out = " & integer'image(to_integer(unsigned(B_out_tb)));
        
        -- Test 3: Both inputs invalid (10 and 13)
        A_tb <= "1010";  -- 10
        B_tb <= "1101";  -- 13
        wait for 10 ns;
        report "Test 3 - A=10, B=13";
        report "A_out = " & integer'image(to_integer(unsigned(A_out_tb)));
        report "B_out = " & integer'image(to_integer(unsigned(B_out_tb)));
        
        -- Test 4: Maximum valid values (9 and 9)
        A_tb <= "1001";  -- 9
        B_tb <= "1001";  -- 9
        wait for 10 ns;
        report "Test 4 - A=9, B=9";
        report "A_out = " & integer'image(to_integer(unsigned(A_out_tb)));
        report "B_out = " & integer'image(to_integer(unsigned(B_out_tb)));
        
        wait;
    end process;
    
end sim;