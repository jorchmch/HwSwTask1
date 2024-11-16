library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_main is
    port(
        bcd_a     : in  STD_LOGIC_VECTOR(3 downto 0);  -- First operand
        bcd_b     : in  STD_LOGIC_VECTOR(3 downto 0);  -- Second operand
        carry_in : in  STD_LOGIC;                     -- Carry input
        mode     : in  STD_LOGIC;                     -- Operation mode (0:Add, 1:Sub)
        z     : out STD_LOGIC;                     -- Zero flag
        anode    : out STD_LOGIC_VECTOR(7 downto 0);  -- Display anode control
        segment  : out STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment display output
        neg      : out STD_LOGIC                      -- Negative flag
    );
end top_main;

architecture Behavioral of top_main is
    -- BCD converter component
    component bcd_top is
        port (
            bcd_a    : in  STD_LOGIC_VECTOR(3 downto 0);
            bcd_b    : in  STD_LOGIC_VECTOR(3 downto 0);
            op_a: out STD_LOGIC_VECTOR(3 downto 0);
            op_b   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Arithmetic unit component
    component adder_subs is
        port(
            op_a     : in  STD_LOGIC_VECTOR(3 downto 0);
            op_b     : in  STD_LOGIC_VECTOR(3 downto 0);
            carry_in : in  STD_LOGIC;
            mode     : in  STD_LOGIC;
            result   : out STD_LOGIC_VECTOR(3 downto 0);
            neg_flag : out STD_LOGIC;
            carry    : out STD_LOGIC
        );
    end component;

    -- Result adjustment component
    component fix_component is
        port(
            result   : in  STD_LOGIC_VECTOR(3 downto 0);
            carry    : in  STD_LOGIC;
            neg_flag : in  STD_LOGIC;
            value    : out STD_LOGIC_VECTOR(3 downto 0);
            z     : out STD_LOGIC
        );
    end component;

    -- Display controller component
    component display is
        port(
            value    : in  STD_LOGIC_VECTOR(3 downto 0);
            z_ten : in  STD_LOGIC;
            anode    : out STD_LOGIC_VECTOR(7 downto 0);
            segment  : out STD_LOGIC_VECTOR(6 downto 0);
            z     : out STD_LOGIC
        );
    end component;

    -- Internal signals
    signal op_a, op_b    : STD_LOGIC_VECTOR(3 downto 0);
    signal result          : STD_LOGIC_VECTOR(3 downto 0);
    signal neg_flag        : STD_LOGIC;
    signal carry           : STD_LOGIC;
    signal final_value     : STD_LOGIC_VECTOR(3 downto 0);
    signal zero_flag       : STD_LOGIC;

begin
    -- BCD to binary conversion
    BCD_CONV: bcd_top port map (
        bcd_a  => bcd_a,
        bcd_b  => bcd_b,
        op_a => op_a,
        op_b => op_b
    );

    -- Arithmetic operation
    ALU: adder_subs port map(
        op_a     => op_a,
        op_b     => op_b,
        carry_in => carry_in,
        mode     => mode,
        result   => result,
        neg_flag => neg_flag,
        carry    => carry
    );

    -- Result adjustment
    ADJUST: fix_component port map(
        result   => result,
        carry    => carry,
        neg_flag => neg_flag,
        value    => final_value,
        z     => zero_flag
    );

    -- Display control
    DISPLAY_CTRL: display port map(
        value    => final_value,
        z_ten => zero_flag,
        anode    => anode,
        segment  => segment,
        z     => z
    );

    -- Output negative flag
    neg <= neg_flag;

end Behavioral;