library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity B_tb is
end B_tb;

architecture Behavioral of B_tb is
    -- Declaración del componente a probar
    component B
        port(
            v    : in STD_LOGIC_VECTOR(3 downto 0);
            z    : out STD_LOGIC;
            an   : out STD_LOGIC_VECTOR(7 downto 0);
            seg0 : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    
    -- Señales de prueba
    signal v_tb    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal z_tb    : STD_LOGIC;
    signal an_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal seg0_tb : STD_LOGIC_VECTOR(6 downto 0);

begin
    -- Instanciación del módulo a probar
    UUT: B port map(
        v    => v_tb,
        z    => z_tb,
        an   => an_tb,
        seg0 => seg0_tb
    );
    
    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Probar algunos valores representativos
        
        -- Caso 1: Entrada 0000
        v_tb <= "0000";
        wait for 100 ns;
        
        -- Caso 2: Entrada 1 0010 (18)
        v_tb <= "0010";
        wait for 100 ns;
        
        -- Caso 3: Entrada 1010 (10)
        v_tb <= "1010";
        wait for 100 ns;
        
        -- Caso 4: Entrada 1111 (15)
        v_tb <= "1111";
        wait for 100 ns;
        
        -- Caso 5: Entrada 1 0001 (17)
        v_tb <= "0001";
        wait for 100 ns;
        
        
        wait;
    end process;
    
end Behavioral;