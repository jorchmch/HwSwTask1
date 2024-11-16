library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_main_tb is
end top_main_tb;

architecture Behavioral of top_main_tb is
    component top_main
    port (
        bcd_a     : in  STD_LOGIC_VECTOR(3 downto 0);  -- First operand
        bcd_b     : in  STD_LOGIC_VECTOR(3 downto 0);  -- Second operand
        carry_in : in  STD_LOGIC;                     -- Carry input
        mode     : in  STD_LOGIC;                     -- Operation mode (0:Add, 1:Sub)
        z     : out STD_LOGIC;                     -- Zero flag
        anode    : out STD_LOGIC_VECTOR(7 downto 0);  -- Display anode control
        segment  : out STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment display output
        neg      : out STD_LOGIC                      -- Negative flag
    );
    end component;
    
    signal A_tb     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal B_tb     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal SEL_tb   : STD_LOGIC := '0';
    signal Cin_tb   : STD_LOGIC := '0';
    signal z_tb     : STD_LOGIC;
    signal z_neg_tb     : STD_LOGIC;
    signal an_tb    : STD_LOGIC_VECTOR(7 downto 0);
    signal seg_tb   : STD_LOGIC_VECTOR(6 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: top_main PORT MAP (
        bcd_a    => A_tb,
        bcd_b    => B_tb,
        carry_in => Cin_tb,
        mode  => SEL_tb,
        z    => z_tb,
        anode   => an_tb,
        segment  => seg_tb,
        neg => z_neg_tb
    );
    
    stim_proc: process
    begin
                
        -- Caso 5: Complemento de números grandes
        SEL_tb <= '0';  -- SUM
        Cin_tb <= '1';
        A_tb <= "1001";  -- 9
        B_tb <= "1001";  -- 9
        wait for CLK_PERIOD;
        
        -- Caso 6: Suma de valores límite
        SEL_tb <= '0';
        Cin_tb <= '0';
        A_tb <= "0000";  -- 1
        B_tb <= "1001";  -- 9
        wait for CLK_PERIOD;
        
        -- Caso 7: Complemento de valores límite
        SEL_tb <= '1';
        Cin_tb <= '0';
        A_tb <= "1000";  -- 8
        B_tb <= "1001";  -- 9
        wait for CLK_PERIOD;
        
        -- Caso 7: Complemento de valores límite
        SEL_tb <= '1';
        Cin_tb <= '1';
        A_tb <= "0000";  -- 0
        B_tb <= "1001";  -- 9
        wait for CLK_PERIOD;
        
                
        wait;
    end process;
end Behavioral;