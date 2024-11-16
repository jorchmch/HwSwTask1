library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C_tb is
--  Port ( );
end C_tb;

architecture Behavioral of C_tb is

component C
port(
		a  	 : in STD_LOGIC_VECTOR (3 downto 0);
		b  	 : in STD_LOGIC_VECTOR (3 downto 0);
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC_VECTOR (3 downto 0);
		cout : out STD_LOGIC
	);
end component;

signal	a_int  	 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal  b_int    : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal  cin_int  : STD_LOGIC := '0';
signal  s_int    : STD_LOGIC_VECTOR (3 downto 0);
signal  cout_int : STD_LOGIC;

begin

DUT: C PORT MAP (a     => a_int,
            b     => b_int,
            cin   => cin_int,
            s     => s_int,
            cout  => cout_int);

    process
        begin
        
        wait for 100 ns; a_int <= "0001";
        wait for 100 ns; a_int <= "0101"; b_int <= "1010";
        wait for 100 ns; a_int <= "1000"; b_int <= "0011";
        wait for 100 ns; cin_int <= '1';
        wait for 100 ns; a_int <= "0001"; b_int <= "1110";
        wait for 200 ns;
        
        wait;
    end process;
end Behavioral;