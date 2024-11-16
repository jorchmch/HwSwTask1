library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_arrag is
    Port ( 
        A    : in  STD_LOGIC_VECTOR(3 downto 0); -- Input A (4 bits)
        B    : in  STD_LOGIC_VECTOR(3 downto 0); -- Input B (4 bits)
        A_orig    : in  STD_LOGIC_VECTOR(3 downto 0); -- Input A original(4 bits)
        B_orig    : in  STD_LOGIC_VECTOR(3 downto 0); -- Input B original(4 bits)
        A_out : out STD_LOGIC_VECTOR(3 downto 0); -- Output A'
        B_out : out STD_LOGIC_VECTOR(3 downto 0)  -- Output B'
    );
end comp_arrag;

architecture Behavioral of comp_arrag is
    -- Signals for interconnecting components
    signal LT_sig : STD_LOGIC; -- Greater-Than Flag from comp_4bit to arrag_4bit

    -- Instantiate the 4-bit comparator component
    component comp_4bit
        Port ( 
            A  : in  STD_LOGIC_VECTOR(3 downto 0);
            B  : in  STD_LOGIC_VECTOR(3 downto 0);
            EQ : out STD_LOGIC;  -- Equality Flag
            LT : out STD_LOGIC;  -- Less-Than Flag
            GT : out STD_LOGIC   -- Greater-Than Flag
        );
    end component;

    -- Instantiate the arrangement component
    component arrag_4bit
        Port ( 
            A  : in  STD_LOGIC_VECTOR(3 downto 0); -- Input A (4 bits)
            B  : in  STD_LOGIC_VECTOR(3 downto 0); -- Input B (4 bits)
            LT : in  STD_LOGIC;                    -- LOWER-Than Flag (1 bit)
            A_out : out STD_LOGIC_VECTOR(3 downto 0); -- Output A'
            B_out : out STD_LOGIC_VECTOR(3 downto 0)  -- Output B'
        );
    end component;

begin
    -- Instantiate the 4-bit comparator
    comparator_inst: comp_4bit
        Port map (
            A  => A_orig,
            B  => B_orig,
            EQ => open,  -- Equality flag not used
            LT => LT_sig,  -- Less-than flag not used
            GT => open -- Connect GT output to GT_sig
        );

    -- Instantiate the 4-bit arrangement
    arrangement_inst: arrag_4bit
        Port map (
            A     => A,
            B     => B,
            LT    => LT_sig, -- Connect GT_sig to GT input
            A_out => A_out,
            B_out => B_out
        );
end Behavioral;
