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
    signal temp_y : std_logic_vector(12 downto 0); -- Use a variable for intermediate result
        
    signal en : std_logic := '1';
    


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
    process (CLK, RST_n, VIN)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT <= (others => '0');
        elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
            DOUT <= y;
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
    begin
        if rising_edge(CLK) then
            temp_w <= (others => '0'); -- Initialize the temporary variable
            
            for i in 0 to 12 loop
                temp_w(i) <= w_i(i) and a1_i(i); -- Bitwise AND operation
                temp_w(i) <= temp_w(i) or (x(i) and not a1_i(i)); -- Bitwise AND-NOT operation
            end loop;
            w <= temp_w; -- Assign the result back to w
        end if;
    end process;


    ff:
    process(CLK)
    begin
        if rising_edge(CLK) then
            temp_y <= (others => '0'); -- Initialize the temporary variable
            
            for i in 0 to 12 loop
              --  temp_y(i) <= w_i(i) and b1_i(i); -- Bitwise AND operation
              -- temp_y(i) <= temp_y(i) or (w(i) and b0_i(i)); -- Bitwise AND-NOT operation
              temp_y(i) <= w_i(i) * b1_i(i) + w(i) *b0_i(i);
            end loop;
            
            y <= temp_y; -- Assign the result back to y
        end if;
    end process;


end behavioral;