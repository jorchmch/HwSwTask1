library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_conv_tb is
end bcd_conv_tb;

architecture sim of bcd_conv_tb is
    -- Component Declaration
    component bcd_conv is
        Port ( 
            din : in STD_LOGIC_VECTOR(3 downto 0);
            dout : out STD_LOGIC_VECTOR(3 downto 0);
            v : out STD_LOGIC
        );
    end component;
    
    -- Signal Declaration
    signal din_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal dout_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal v_tb : STD_LOGIC;
    
begin
    -- Component Instantiation
    uut: bcd_conv 
    port map (
        din => din_tb,
        dout => dout_tb,
        v => v_tb
    );
    
    -- Stimulus Process
    stim_proc: process
    begin
        -- Test all values from 0 to 15
        for i in 0 to 15 loop
            din_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            
            -- Print results
            report "Input: " & integer'image(i) & 
                  " Output: " & integer'image(to_integer(unsigned(dout_tb))) &
                  " Valid: " & std_logic'image(v_tb);
        end loop;
        
        -- Additional specific test cases
        -- Test 9 (maximum valid BCD)
        din_tb <= "1001";
        wait for 10 ns;
        assert dout_tb = "1001" 
            report "Failed at input 9" 
            severity ERROR;
            
        -- Test 10 (should output 0)
        din_tb <= "1010";
        wait for 10 ns;
        assert dout_tb = "0000" 
            report "Failed at input 10" 
            severity ERROR;
            
        wait;
    end process;
    
end sim;