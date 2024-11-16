library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_arrag_tb is
-- No ports in testbench
end comp_arrag_tb;

architecture Behavioral of comp_arrag_tb is
    -- Component declaration for comp_arrag
    component comp_arrag
        Port ( 
            A     : in  STD_LOGIC_VECTOR(3 downto 0);
            B     : in  STD_LOGIC_VECTOR(3 downto 0);
            A_out : out STD_LOGIC_VECTOR(3 downto 0);
            B_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Test signals
    signal A, B       : STD_LOGIC_VECTOR(3 downto 0);
    signal A_out, B_out : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate comp_arrag component
    uut: comp_arrag
        Port map (
            A     => A,
            B     => B,
            A_out => A_out,
            B_out => B_out
        );

    -- Test process
    test_proc: process
    begin
        -- Test Case 1: A = 0010, B = 0001 (A > B)
        A <= "0010"; B <= "0001";
        wait for 100 ns;
        -- Expected: A_out = A, B_out = B

        -- Test Case 2: A = 0001, B = 0010 (A < B)
        A <= "0001"; B <= "0010";
        wait for 100 ns;
        -- Expected: A_out = B, B_out = A

        -- Test Case 3: A = 1010, B = 1010 (A = B)
        A <= "1010"; B <= "1010";
        wait for 100 ns;
        -- Expected: A_out = A, B_out = B

        -- Test Case 4: A = 1101, B = 0101 (A > B)
        A <= "1101"; B <= "0101";
        wait for 100 ns;
        -- Expected: A_out = A, B_out = B

        -- Test Case 5: A = 0110, B = 1100 (A < B)
        A <= "0110"; B <= "1100";
        wait for 100 ns;
        -- Expected: A_out = B, B_out = A

        wait;
    end process;

end Behavioral;
