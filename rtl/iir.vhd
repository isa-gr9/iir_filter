library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;


entity iir is
    port (
        CLK, RST_n : in std_logic;
        
        VIN : in std_logic;
        DIN : in std_logic_vector(12 downto 0);
        a1 : in std_logic_vector(12 downto 0);
        b0 : in std_logic_vector(12 downto 0);
        b1 : in std_logic_vector(12 downto 0);

        DOUT : out std_logic_vector(12 downto 0);
        VOUT : out std_logic
        
        );
end iir;
        
architecture behavioral of iir is
        
    signal x : std_logic_vector(12 downto 0);
    signal y : std_logic_vector(12 downto 0);
    signal w : std_logic_vector(12 downto 0);
    signal w_i : std_logic_vector(12 downto 0);
    
    signal a1_i: std_logic_vector(12 downto 0);
    signal b1_i: std_logic_vector(12 downto 0);
    signal b0_i: std_logic_vector(12 downto 0);    
    signal temp_w : std_logic_vector(12 downto 0); -- Use a variable for intermediate result
    signal temp_y : std_logic_vector(4 downto 0); -- Use a variable for intermediate result
   

        
    signal en : std_logic := '1';
    signal en2 : std_logic;

    constant NB : integer := 13;         -- Number of bits (NB)
    constant SHAMT : integer := 21;     -- Number of bits to shift (SHAMT)


begin
        
    RIN:
    process (CLK, RST_n, VIN)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
        x <= (others => '0');
        elsif (VIN ='1' and CLK'event and CLK = '1') then  -- rising clock edge           
        x <= DIN;
        end if;
    end process;
    
    ROUT:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT <= (others => '0');
        elsif (en2='1' and CLK'event and CLK = '1') then  -- rising clock edge           
            DOUT <= y;
            VOUT <= '1';
        end if;
    end process;
    
    AB:
    process (CLK, RST_n, VIN)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            a1_i <= (others => '0');
            b0_i <= (others => '0');
            b1_i <= (others => '0');
        elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
            a1_i <= a1;
            b0_i <= b0;
            b1_i <= b1;
        end if;
    end process;


    --INTERNAL REGISTER
    R1:
    process (CLK, RST_n, VIN)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            w_i <= (others => '0');
        elsif (en = '1' and CLK'event and CLK = '1') then  -- rising clock edge           
            w_i <= w;
        end if;
    end process;

        

    fb:
    process(CLK)
    variable mul1 : std_logic_vector(25 downto 0);
    begin
        if rising_edge(CLK) then
            temp_w <= (others => '0'); -- Initialize the temporary variable
            mul1 := w_i * a1_i;
            temp_w <= x + mul1(4 downto 0);
            w <= temp_w; -- Assign the result back to w
        end if;
    end process;


    ff:
    process(CLK)
    variable mul2 : std_logic_vector(25 downto 0);
    variable mul3 : std_logic_vector(25 downto 0);
    begin
        if rising_edge(CLK) then
            temp_y <= (others => '0'); -- Initialize the temporary variable
            mul2 := w_i * b1_i;
            mul3 := w * b0_i;
            temp_y <= mul2(4 downto 0) + mul3(4 downto 0);
            y <= temp_y & "00000000"; -- Assign the result back to y
            en2 <= '1';

        end if;
    end process;


end behavioral;