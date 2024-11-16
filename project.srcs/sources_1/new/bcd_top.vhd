library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_top is
    Port ( 
        bcd_a    : in  STD_LOGIC_VECTOR(3 downto 0);
        bcd_b    : in  STD_LOGIC_VECTOR(3 downto 0);
        op_a: out STD_LOGIC_VECTOR(3 downto 0);
        op_b   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end bcd_top;

architecture Behavioral of bcd_top is
    component bcd_conv is
        Port ( 
            din : in STD_LOGIC_VECTOR(3 downto 0);
            dout : out STD_LOGIC_VECTOR(3 downto 0);
            v : out STD_LOGIC
        );
    end component;
    
    signal conv_a_out: STD_LOGIC_VECTOR(3 downto 0);
    signal conv_b_out: STD_LOGIC_VECTOR(3 downto 0);
    signal v_a, v_b: STD_LOGIC;
    signal valid_output: STD_LOGIC;
    
begin
    conv_a: bcd_conv 
    port map(
        din => bcd_a,
        dout => conv_a_out,
        v => v_a
    );
    
    conv_b: bcd_conv 
    port map(
        din => bcd_b,
        dout => conv_b_out,
        v => v_b
    );
    
    -- valid_output será '1' solo cuando ambos números son válidos (v_a y v_b son '0')
    valid_output <= not (v_a or v_b);
    
    -- Output logic using only boolean operations
    op_a(0) <= conv_a_out(0) and valid_output;
    op_a(1) <= conv_a_out(1) and valid_output;
    op_a(2) <= conv_a_out(2) and valid_output;
    op_a(3) <= conv_a_out(3) and valid_output;
    
    op_b(0) <= conv_b_out(0) and valid_output;
    op_b(1) <= conv_b_out(1) and valid_output;
    op_b(2) <= conv_b_out(2) and valid_output;
    op_b(3) <= conv_b_out(3) and valid_output;
    
end Behavioral;