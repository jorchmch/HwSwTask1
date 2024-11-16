library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_4bit is
    Port ( 
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        EQ : out STD_LOGIC;  -- Equality Flag
        LT : out STD_LOGIC;  -- Less-Than Flag
        GT : out STD_LOGIC   -- Greater-Than Flag
    );
end comp_4bit;

architecture Behavioral of comp_4bit is
    -- 1-bit Comparator Component Declaration
    component comp_1bit
        Port ( 
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            I : out STD_LOGIC;  -- Flag de Igualdad
            T : out STD_LOGIC;  -- Flag de A menor que B
            H : out STD_LOGIC   -- Flag de A mayor que B
        );
    end component;

    -- Intermediate signals for comparator connections
    signal eq_sigs : STD_LOGIC_VECTOR(3 downto 0);
    signal lt_sigs : STD_LOGIC_VECTOR(3 downto 0);
    signal gt_sigs : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- 1-bit Comparator Generation
    comps: for i in 0 to 3 generate
        comp: comp_1bit port map(
            a => A(i),
            b => B(i),
            I => eq_sigs(i),
            T => lt_sigs(i),
            H => gt_sigs(i)
        );
    end generate;

    -- Global Flag Logic
    -- Equality: All bits must match
    EQ <= eq_sigs(0) and eq_sigs(1) and eq_sigs(2) and eq_sigs(3);

    -- Less-Than: Analyze from most significant to least significant bit
    LT <= lt_sigs(3) or 
          (eq_sigs(3) and lt_sigs(2)) or 
          (eq_sigs(3) and eq_sigs(2) and lt_sigs(1)) or
          (eq_sigs(3) and eq_sigs(2) and eq_sigs(1) and lt_sigs(0));

    -- Greater-Than: Analyze from most significant to least significant bit
    GT <= gt_sigs(3) or 
          (eq_sigs(3) and gt_sigs(2)) or 
          (eq_sigs(3) and eq_sigs(2) and gt_sigs(1)) or
          (eq_sigs(3) and eq_sigs(2) and eq_sigs(1) and gt_sigs(0));
end Behavioral;

