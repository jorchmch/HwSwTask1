library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selection is
    Port ( 
        B    : in  STD_LOGIC_VECTOR (3 downto 0);
        SEL  : in  STD_LOGIC;
        Bout : out STD_LOGIC_VECTOR (3 downto 0)
    );
end selection;

architecture Behavioral of selection is
    -- Componente sumador
    Component twos_comp
    port(
        num : in STD_LOGIC_VECTOR(3 downto 0);
        num_2s : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end Component;

    -- Señales intermedias para el complemento 2
    signal B_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal B_2comp : STD_LOGIC_VECTOR (3 downto 0);
    signal unused_cout : STD_LOGIC;

begin
    
    two_s_comp: twos_comp PORT MAP (
        num    => B,
        num_2s => B_out  
    );
    
    -- Paso 2: Selección de la salida de B
    Bout(0) <= (B(0) and not SEL) or (B_out(0) and SEL);
    Bout(1) <= (B(1) and not SEL) or (B_out(1) and SEL);
    Bout(2) <= (B(2) and not SEL) or (B_out(2) and SEL);
    Bout(3) <= (B(3) and not SEL) or (B_out(3) and SEL);
    
    
end Behavioral;