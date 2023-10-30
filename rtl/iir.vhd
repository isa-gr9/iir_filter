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
    signal y              : std_logic_vector(NB -1 downto 0);

    --14 bit 
    signal x_tmp          : std_logic_vector(NB downto 0);
    signal y_tmp          : std_logic_vector(NB downto 0);



    signal w, sw          : std_logic_vector(NB downto 0);
    signal fb, ff         : std_logic_vector(NB downto 0);
	signal fb_ext, ff_ext : std_logic_vector(2*NB+1 downto 0);
   
    -- Internal parameters after the registers
    signal a1_i, b1_i, b0_i: std_logic_vector(NB downto 0);
    --signal a1_i, b1_i, b0_i: std_logic_vector(NB -1 downto 0);



    signal temp_c  : std_logic_vector(2*NB +1 downto 0);
  
    
    -- Signal that shift the multiplication output
    signal c   : std_logic_vector(NB  downto 0);

    
    
    begin
        -- Temporary signals for storing the multiplication
        
    --################ Implementation ###################
        
    
        fb_ext <= std_logic_vector(signed(sw) * signed(a1_i));
        fb     <= fb_ext(2*NB-2) & fb_ext(2*NB-2 downto SHAMT) & "00000000";

        ff_ext <= std_logic_vector(signed(sw) * signed(b1_i));
        ff     <= ff_ext(2*NB-2) & ff_ext(2*NB-2 downto SHAMT) & "00000000";

        x_tmp <= x(NB-1) & x;
        w <=  std_logic_vector(signed(x_tmp) - signed(fb));
        
        temp_c <= std_logic_vector(signed(w) * signed (b0_i));
        c <= temp_c(2*NB-2) & temp_c(2*NB-2 downto SHAMT) & "00000000";

        y_tmp <= std_logic_vector(signed(c) + signed(ff));
        y <= y_tmp(NB-1 downto 0);


    --################### Registers ################################
    
    -- Input registers
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
                a1_i  <= a1(NB-1) & a1;
                b0_i  <= b0(NB-1) & b0;
                b1_i  <= b1(NB-1) & b1;
            else
                vin_i <= '0';
                x     <= (others => '0');
                a1_i  <= a1(NB-1) & a1;
                b0_i  <= b0(NB-1) & b0;
                b1_i  <= b1(NB-1) & b1;
            end if;
        end if;
    end process;

    -- Output registersz
    u_rout:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT        <= (others => '0');
            --sw          <= (others => '0');
            VOUT        <= '0';
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                VOUT    <= '1';
                DOUT    <= std_logic_vector(y);
            else
                VOUT    <= '0';
                DOUT    <=  std_logic_vector(y);
            end if;
        end if;
    end process;
            --Internal Register
    u_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            sw <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                sw <= w;
            end if;
        end if;
    end process;
end behavioral;