library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_4bit_tb is
end comp_4bit_tb;

architecture Behavioral of comp_4bit_tb is
    -- Component declaration for comp_4bit
    component comp_4bit
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            EQ : out STD_LOGIC;  -- Equality Flag
            LT : out STD_LOGIC;  -- Less-Than Flag
            GT : out STD_LOGIC   -- Greater-Than Flag
        );
    end component;

    -- Signals for testing
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal EQ, LT, GT : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: comp_4bit
        Port map (
            A => A,
            B => B,
            EQ => EQ,
            LT => LT,
            GT => GT
        );

    -- Test process
    process
    begin
        -- Test Case 1: A = B = "0000" (Expect EQ = '1', LT = '0', GT = '0')
        A <= "0000"; B <= "0000";
        wait for 100 ns;

        -- Test Case 2: A = "0001", B = "0010" (Expect EQ = '0', LT = '1', GT = '0')
        A <= "0001"; B <= "0010";
        wait for 100 ns;

        -- Test Case 3: A = "0101", B = "0101" (Expect EQ = '1', LT = '0', GT = '0')
        A <= "0101"; B <= "0101";
        wait for 100 ns;

        -- Test Case 4: A = "1110", B = "1101" (Expect EQ = '0', LT = '0', GT = '1')
        A <= "1110"; B <= "1101";
        wait for 100 ns;

        -- Test Case 5: A = "0011", B = "1010" (Expect EQ = '0', LT = '1', GT = '0')
        A <= "0011"; B <= "1010";
        wait for 100 ns;

        -- Test Case 6: A = "1111", B = "1111" (Expect EQ = '1', LT = '0', GT = '0')
        A <= "1111"; B <= "1111";
        wait for 100 ns;

        -- Test Case 7: A = "1000", B = "0100" (Expect EQ = '0', LT = '0', GT = '1')
        A <= "1000"; B <= "0100";
        wait for 100 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
