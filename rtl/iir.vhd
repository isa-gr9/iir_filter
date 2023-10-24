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
    signal vin_i          : std_logic;
    signal x              : std_logic_vector(NB -1 downto 0);
    signal y              : signed(NB -1 downto 0);
    signal w, sw          : signed(NB -1 downto 0);
    signal fb, ff         : signed(NB -1 downto 0);
	signal fb_ext, ff_ext : signed(2*NB -1 downto 0);
   
    -- Internal parameters after the registers
    signal a1_i, b1_i, b0_i: signed(NB -1 downto 0);

    signal temp_c  : signed(2*NB - 1 downto 0);
    signal temp_d  : signed(2*NB - 1 downto 0);
    signal temp_e  : signed(2*NB - 1 downto 0);    
    
    -- Signal that shift the multiplication output
    signal c   : signed(NB -1 downto 0);
    signal d   : signed(NB -1 downto 0); 
    signal e   : signed(NB -1 downto 0);
    

    signal en : std_logic := '1';
    
    
    begin
        -- Temporary signals for storing the multiplication
        
    --################ Implementation ###################
        
        fb_ext <= signed(sw) * signed(a1_i);
        --fb_ext <= ((signed(sw) * signed(a1_i)) sll SHAMT) srl (SHAMT - NB + 1);
        fb     <= fb_ext(2*NB-2 downto 2*NB-6) & "00000000";

        --ff_ext <= ((signed(sw) * signed(b1_i)) sll SHAMT) srl (SHAMT - NB + 1);
        ff_ext <= signed(sw) * signed(b1_i);
        ff     <= ff_ext(2*NB-2 downto 2*NB-6) & "00000000";

        w <= signed(x) - fb;
        
        temp_c <= signed(w) * signed (b0_i);
        c <= temp_c(2*NB-2 downto 2*NB-6) & "00000000";

        y <= c + ff;
        --temp_c <= a1_i * sw;
        --temp_d <= b1_i * sw;
        --temp_e <= b0_i * w;
        --
        --c <=  temp_c(2*NB-2 downto NB - 1);--temp_c(24 downto 20) & "00000000";
        --d <=  temp_d(2*NB-2 downto NB - 1);--temp_d(24 downto 20) & "00000000";
        --e <=  temp_e(2*NB-2 downto NB - 1);--temp_e(24 downto 20) & "00000000";
        ----
        --w <= signed(x) + c;      
        --y <= e + d;
    

    --################### Registers ################################
    
    u_iir_reg1:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            x     <= (others => '0');
            vin_i <= '0';
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (VIN = '1') then
                vin_i <= '1';
                x     <= DIN;
            else
                vin_i <= '0';
                x     <= DIN;
            end if;
        end if;
    end process;
    
    u_iir_reg2:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT        <= (others => '0');
            sw         <= (others => '0');
            VOUT        <= '0';
            a1_i        <= (others => '0');
            b0_i        <= (others => '0');
            b1_i        <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                VOUT    <= '1';
                DOUT    <= std_logic_vector(y);
                sw     <= signed(w);
                a1_i    <= signed(a1);
                b0_i    <= signed(b0);
                b1_i    <= signed(b1);
            else
                sw     <= signed(w);
                VOUT    <= '0';
                DOUT    <= std_logic_vector(y);
            end if;
        end if;
    end process;


    --iir_reg1:
    --process (CLK, RST_n)
    --begin
    --    if (RST_n = '0') then                 -- asynchronous reset (active low)
    --        x     <= (others => '0');
    --        vin_i <= '0';
    --    elsif (VIN ='1' and CLK'event and CLK = '1') then  -- rising clock edge           
    --        x <= DIN;
    --    end if;
    --end process;
    --
    --u_rout:
    --process (CLK, RST_n)
    --begin
    --    if (RST_n = '0') then                 -- asynchronous reset (active low)
    --        DOUT <= (others => '0');
    --    elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
    --        DOUT <= std_logic_vector(y);
    --        VOUT <= '1';
    --    end if;
    --end process;
    --
    --u_parameters:
    --process (CLK, RST_n)
    --begin
    --    if (RST_n = '0') then                 -- asynchronous reset (active low)
    --        a1_i <= (others => '0');
    --        b0_i <= (others => '0');
    --        b1_i <= (others => '0');
    --    elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
    --        a1_i <= signed(a1);
    --        b0_i <= signed(b0);
    --        b1_i <= signed(b1);
--
    --    end if;
    --end process;
--
    ----Internal Register
    --u_reg:
    --process (CLK, RST_n)
    --begin
    --    if (RST_n = '0') then                 -- asynchronous reset (active low)
    --        sw <= (others => '0');
    --    elsif (CLK'event and CLK = '1') then  -- rising clock edge           
    --        sw <= w;
    --    end if;
    --end process;
--
--
    --

end behavioral;