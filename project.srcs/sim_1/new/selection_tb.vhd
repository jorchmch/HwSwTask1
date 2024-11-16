library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity selection_tb is
end selection_tb;

architecture Behavioral of selection_tb is
    -- Declaración del componente a probar
    component selection
    Port ( 
        A    : in  STD_LOGIC_VECTOR (3 downto 0);
        B    : in  STD_LOGIC_VECTOR (3 downto 0);
        SEL  : in  STD_LOGIC;
        Aout : out STD_LOGIC_VECTOR (3 downto 0);
        Bout : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
    
    -- Señales de prueba
    signal A_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal B_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal SEL_tb  : STD_LOGIC;
    signal Aout_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal Bout_tb : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    -- Instanciar el módulo bajo prueba
    UUT: selection PORT MAP (
        A    => A_tb,
        B    => B_tb,
        SEL  => SEL_tb,
        Aout => Aout_tb,
        Bout => Bout_tb
    );
    
    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Prueba exhaustiva de combinaciones
        for i in 0 to 15 loop     -- Valores de A
            for j in 0 to 15 loop -- Valores de B
                for k in 0 to 1 loop  -- Valores de SEL
                    -- Asignar valores de prueba
                    A_tb <= std_logic_vector(to_unsigned(i, 4));
                    B_tb <= std_logic_vector(to_unsigned(j, 4));
                    SEL_tb <= std_logic(to_unsigned(k, 1)(0));
                    
                    wait for 10 ns;
                    
                    -- Verificaciones
                    -- Aout siempre debe ser igual a A
                    assert Aout_tb = A_tb 
                        report "Error: Aout no coincide con A" 
                        severity ERROR;
                    
                    -- Verificar selección de Bout
                    if SEL_tb = '0' then
                        -- Cuando SEL = 0, Bout debe ser igual a B
                        assert Bout_tb = B_tb 
                            report "Error: Bout no coincide con B cuando SEL = 0" 
                            severity ERROR;
                    else
                        -- Cuando SEL = 1, Bout debe ser complemento 2 de B
                        -- Calcular complemento 2 manualmente
                        assert Bout_tb = std_logic_vector(unsigned(not B_tb) + 1)
                            report "Error: Bout no es complemento 2 de B cuando SEL = 1" 
                            severity ERROR;
                    end if;
                end loop;
            end loop;
        end loop;
        
        -- Mensaje de finalización
        report "Simulación completada. Todas las pruebas realizadas.";
        wait;
    end process;
end Behavioral;
