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
    constant NB    : positive := 13;  -- Shift amount
    
    -- Internal signals
    signal x   : std_logic_vector(NB -1 downto 0);
    signal y   : std_logic_vector(NB -1 downto 0);
    signal w   : std_logic_vector(NB -1 downto 0);
    signal w_i : std_logic_vector(NB -1 downto 0);
   
    -- Internal parameters after the registers
    signal a1_i: std_logic_vector(NB -1 downto 0);
    signal b1_i: std_logic_vector(NB -1 downto 0);
    signal b0_i: std_logic_vector(NB -1 downto 0);    

    -- Temporary signals for storing the multiplication
    signal temp_c  : std_logic_vector(25 downto 0) := (others => '0');
    signal temp_d  : std_logic_vector(25 downto 0) := (others => '0');
    signal temp_e  : std_logic_vector(25 downto 0) := (others => '0');    
                 
    -- Signal that shift the multiplication output
    signal c   : std_logic_vector(NB -1 downto 0) := (others => '0');
    signal d   : std_logic_vector(NB -1 downto 0) := (others => '0'); 
    signal e   : std_logic_vector(NB -1 downto 0) := (others => '0');
        
    signal en : std_logic := '1';


begin
    
    --################### Registers ################################
    
    u_rin:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            x <= (others => '0');
        elsif (VIN ='1' and CLK'event and CLK = '1') then  -- rising clock edge           
            x <= DIN;
        end if;
    end process;
    
    u_rout:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT <= (others => '0');
        elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
            DOUT <= y;
            VOUT <= '1';
        end if;
    end process;
    
    u_parameters:
    process (CLK, RST_n)
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

    --Internal Register
    u_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            w_i <= (others => '0');
        elsif (en = '1' and CLK'event and CLK = '1') then  -- rising clock edge           
            w_i <= w;
        end if;
    end process;

    --################ Implementation ###################
    
    --u_filter:
    --process (CLK, RST_N)
    --begin
    --    temp_c <= a1 * w_i;
    --    temp_d <= b1 * w_i;
    --    temp_e <= b0 * w;
    --    
    --    c <=  temp_c(24 downto 20) & "00000000";
    --    d <=  temp_d(24 downto 20) & "00000000";
    --    e <=  temp_e(24 downto 20) & "00000000";
--
    --    w <= x + c;
    --    y <= e + d;
    --end process;



    u_fb:
    process (CLK, RST_N)
    begin
        temp_c <= a1 * w_i;
        
        c <=  temp_c(24 downto 20) & "00000000";

        w <= x + c;

    end process;

    u_ff:
    process (CLK, RST_N)
    begin
        temp_d <= a1 * w_i;
        temp_e <= b0 * w;
        
        d <=  temp_d(24 downto 20) & "00000000";
        e <=  temp_e(24 downto 20) & "00000000";

        y <= e + d;

    end process;
    
    --A:
    --process(CLK, RST_n, VIN)
    --begin
    --    if RST_n = '0' then
    --        sw <= (others => '0');
    --        fb <= (others => '0');
    --        ff <= (others => '0');
    --        w_i <= (others => '0');
    --        elsif (en='1' and CLK'event and CLK = '1') then  -- rising clock edge 
    --        -- Compute feed-back and feed-forward
    --       -- fb_temp <= sw * a1_i;
    --       -- fb_temp2 <= fb_temp(24 downto 20) & "00000000";
    --       -- fb <= fb - fb_temp2;
    --        --ff_temp <= sw * b1_i;
    --       -- ff_temp2 <= ff_temp(24 downto 20) & "00000000";
    --        --ff <= ff + ff_temp2;
    --        --w_i <= x + fb;
    --        y_temp <= x * b0_i;
    --        y <= y_temp(24 downto 20) & "00000000";
    --        --y <= ff + y_temp2;
    --    end if;
    --end process;
    
end behavioral;