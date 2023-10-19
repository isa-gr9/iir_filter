library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_arith.SIGNED;
use IEEE.NUMERIC_STD.ALL;
use ieee.NUMERIC_STD.SIGNED;
use ieee.std_logic_arith.SIGNED;


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
    constant SHAMT : positive := 20;  -- Shift amount
    constant NB : positive := 13;  -- Shift amount
        
    signal x : std_logic_vector(12 downto 0);
    signal y : std_logic_vector(12 downto 0);
    signal w : std_logic_vector(12 downto 0);
   
    
    signal a1_i: std_logic_vector(12 downto 0);
    signal b1_i: std_logic_vector(12 downto 0);
    signal b0_i: std_logic_vector(12 downto 0);    

    signal y_temp2 : std_logic_vector(12 downto 0) := (others => '0');
    signal y_temp : std_logic_vector(25 downto 0) := (others => '0');
    signal fb_temp : std_logic_vector(25 downto 0) := (others => '0');
    signal fb_temp2 : std_logic_vector(12 downto 0) := (others => '0');
    signal ff_temp2 : std_logic_vector(12 downto 0) := (others => '0');
    signal ff_temp : std_logic_vector(25 downto 0) := (others => '0');
    signal fb: std_logic_vector(12 downto 0) := (others => '0');
    signal ff: std_logic_vector(12 downto 0) := (others => '0');
    signal sw: std_logic_vector(12 downto 0) := (others => '0');
    signal w_i : std_logic_vector(12 downto 0) := (others => '0');
    
                    
        
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
    process (CLK, RST_n, VIN, y)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT <= (others => '0');
        elsif (en='1' and CLK'event and CLK = '1') then  -- rising clock edge           
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
    --R1:
    --process (CLK, RST_n, VIN)
    --begin
     --   if (RST_n = '0') then                 -- asynchronous reset (active low)
      --      w_i <= (others => '0');
       -- elsif (en = '1' and CLK'event and CLK = '1') then  -- rising clock edge           
        --    w_i <= w;
        --end if;
    --end process;

        

    A:
    process(CLK, RST_n, x, VIN)
    begin
        if RST_n = '0' then
            sw <= (others => '0');
            fb <= (others => '0');
            ff <= (others => '0');
            w_i <= (others => '0');
            elsif (en='1' and CLK'event and CLK = '1') then  -- rising clock edge 
            -- Compute feed-back and feed-forward
           -- fb_temp <= sw * a1_i;
           -- fb_temp2 <= fb_temp(24 downto 20) & "00000000";
           -- fb <= fb - fb_temp2;
            --ff_temp <= sw * b1_i;
           -- ff_temp2 <= ff_temp(24 downto 20) & "00000000";
            --ff <= ff + ff_temp2;
            --w_i <= x + fb;
            y_temp <= x * b0_i;
            y <= y_temp(24 downto 20) & "00000000";
            --y <= ff + y_temp2;
        end if;
    end process;
    
end behavioral;