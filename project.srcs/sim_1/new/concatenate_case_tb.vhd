library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity concatenate_case_tb is
end concatenate_case_tb;

architecture Behavioral of concatenate_case_tb is
    -- Declaración de señales para conectar con el componente
    signal S_tb     : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_tb  : STD_LOGIC;
    signal S_out_tb : STD_LOGIC_VECTOR(3 downto 0);
    
    -- Declaración del componente a probar
    component concatenate_case is
        Port ( 
            S     : in  STD_LOGIC_VECTOR(3 downto 0);
            Cout  : in  STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
begin
    -- Instanciación del componente
    UUT: concatenate_case 
        port map (
            S     => S_tb,
            Cout  => Cout_tb,
            S_out => S_out_tb
        );
    
    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Caso inicial
        S_tb <= "0000";
        Cout_tb <= '0';
        wait for 10 ns;
        
        -- Prueba para número 16 (Cout='1', S="0000")
        S_tb <= "0000";
        Cout_tb <= '1';  -- 16 en binario: 10000
        wait for 10 ns;
        assert S_out_tb = "0110"  -- Debe ser 6
            report "Error en caso 16: Salida esperada 6"
            severity error;
            
        -- Prueba para número 17 (Cout='1', S="0001")
        S_tb <= "0001";
        Cout_tb <= '1';  -- 17 en binario: 10001
        wait for 10 ns;
        assert S_out_tb = "0111"  -- Debe ser 7
            report "Error en caso 17: Salida esperada 7"
            severity error;
            
        -- Prueba para número 18 (Cout='1', S="0010")
        S_tb <= "0010";
        Cout_tb <= '1';  -- 18 en binario: 10010
        wait for 10 ns;
        assert S_out_tb = "1000"  -- Debe ser 8
            report "Error en caso 18: Salida esperada 8"
            severity error;
            
        -- Prueba para un caso que debe dar cero
        S_tb <= "0011";
        Cout_tb <= '1';  -- 19 en binario: 10011
        wait for 10 ns;
        assert S_out_tb = "0000"  -- Debe ser 0
            report "Error en caso 19: Salida esperada 0"
            severity error;
            
        -- Prueba adicional para otro caso que debe dar cero
        S_tb <= "1111";
        Cout_tb <= '0';
        wait for 10 ns;
        assert S_out_tb = "0000"  -- Debe ser 0
            report "Error en caso aleatorio: Salida esperada 0"
            severity error;
        
        -- Fin de la simulación
        wait for 10 ns;
        report "Simulación completada";
        wait;
    end process;
    
end Behavioral;