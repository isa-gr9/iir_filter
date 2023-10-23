library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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
    signal y   : signed(NB -1 downto 0);
    signal w   : signed(NB -1 downto 0);
    signal w_i : signed(NB -1 downto 0);
   
    -- Internal parameters after the registers
    signal a1_i: signed(NB -1 downto 0);
    signal b1_i: signed(NB -1 downto 0);
    signal b0_i: signed(NB -1 downto 0);    


    signal temp_c  : signed(25 downto 0) := (others => '0');
    signal temp_d  : signed(25 downto 0) := (others => '0');
    signal temp_e  : signed(25 downto 0) := (others => '0');    
    
    -- Signal that shift the multiplication output
    signal c   : signed(NB -1 downto 0) := (others => '0');
    signal d   : signed(NB -1 downto 0) := (others => '0'); 
    signal e   : signed(NB -1 downto 0) := (others => '0');
    
    signal en : std_logic := '1';
    
    
    begin
        -- Temporary signals for storing the multiplication
        
        --################ Implementation ###################
        
        --TBD: METTERE TO SIGNED
    
        temp_c <= a1_i * w_i;
        temp_d <= b1_i * w_i;
        temp_e <= b0_i * w;
    
        c <=  temp_c(25 downto 20) & "0000000";
        d <=  temp_d(25 downto 20) & "0000000";
        e <=  temp_e(25 downto 20) & "0000000";
        
        
        w <= signed(x) + c;      
        y <= e + d;
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
            DOUT <= std_logic_vector(y);
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
            a1_i <= signed(a1);
            b0_i <= signed(b0);
            b1_i <= signed(b1);

        end if;
    end process;

    --Internal Register
    u_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            w_i <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            w_i <= w;
        end if;
    end process;


    
end behavioral;