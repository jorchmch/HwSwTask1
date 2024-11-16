library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Neg_det is
    Port ( 
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        SEL : in STD_LOGIC;
        N : out STD_LOGIC
    );
end Neg_det;

architecture Structural of Neg_det is
    -- 1-bit Comparator Component Declaration
    component comp_1bit
        Port ( 
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            I : out STD_LOGIC;
            T : out STD_LOGIC;
            H : out STD_LOGIC
        );
    end component;
    
    -- Intermediate signals for each comparator's results
    signal eq_signals : STD_LOGIC_VECTOR(3 downto 0);
    signal lt_signals : STD_LOGIC_VECTOR(3 downto 0);  -- A < B
    signal gt_signals : STD_LOGIC_VECTOR(3 downto 0);
    signal b_greater_than_a : STD_LOGIC;
    
begin
    -- Generation of 1-bit comparators
    comparators: for i in 0 to 3 generate
        comp_unit: comp_1bit port map(
            a => A(i),
            b => B(i),
            I => eq_signals(i),
            T => lt_signals(i),
            H => gt_signals(i)
        );
    end generate;
    
    -- Intermediate signal for B > A condition
    b_greater_than_a <= lt_signals(3) or 
                       (eq_signals(3) and lt_signals(2)) or 
                       (eq_signals(3) and eq_signals(2) and lt_signals(1)) or
                       (eq_signals(3) and eq_signals(2) and eq_signals(1) and lt_signals(0));
    
    -- N = 1 only when B > A and SEL = 1
    N <= b_greater_than_a and SEL;

end Structural;
