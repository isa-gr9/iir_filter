library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity iir_advanced is
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
end iir_advanced;
        
architecture behavioral of iir_advanced is
    constant SHAMT           :    positive := 20;  -- Shift amount
    constant NB              :    positive := 13;  -- Shift amount
    constant NB_MUL          :    positive := 28;
    
    -- Internal signals
    signal vin_i             :    std_logic;   --
    signal y                 :    std_logic_vector(NB -1 downto 0);
    
    --14 bit signals for managing the overflow 
    signal x, x_1                 :    std_logic_vector(NB downto 0);
    signal y_tmp             :    std_logic_vector(NB downto 0);
    signal a1_i, b1_i, b0_i  :    std_logic_vector(NB downto 0);
    signal w, w_1, w_2           :    std_logic_vector(NB downto 0);
    signal c, c_1          :    std_logic_vector(NB downto 0);
    signal d, d_1          :    std_logic_vector(NB downto 0);
    signal e, e_1, e_2          :    std_logic_vector(NB downto 0);
    signal g, g_1          :    std_logic_vector(NB downto 0);
    signal f, f_1, f_2          :    std_logic_vector(NB downto 0);


    signal a2           :    std_logic_vector(NB downto 0);
    signal c_ext, e_ext, f_ext, g_ext    :    std_logic_vector(NB_MUL - 1 downto 0);
	signal a2_ext    :    std_logic_vector(NB_MUL -1 downto 0);
   

    
    
begin      

--##############################################################
--################### Registers ################################
--##############################################################
    
    -- Input registers
    u_iir_reg1:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            x         <= (others => '0');
            vin_i     <= '0';
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (VIN = '1') then
                vin_i <= '1';
                x     <= DIN(NB-1) & DIN;   --x is 14 bit, extend the MSB of DIN
                a1_i  <= a1(NB-1) & a1;     --Same for the parameters
                b0_i  <= b0(NB-1) & b0;
                b1_i  <= b1(NB-1) & b1;
            else
                vin_i <= '0';
                x     <= (others => '0');
            end if;
        end if;
    end process;

    -- Output registers
    u_rout:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            DOUT        <= (others => '0');
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
    w0_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            w_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                w_1 <= w;
            end if;
        end if;
    end process;

    w1_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            w_2 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                w_2 <= w_1;
            end if;
        end if;
    end process;

    x0_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            x_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                x_1 <= x;
            end if;
        end if;
    end process;

-- Pipeline optimization registers

ff1_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            c_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                c_1 <= c;
            end if;
        end if;
    end process;

d_reg:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            d_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                d_1 <= d;
            end if;
        end if;
    end process;

fb_reg1:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            e_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                e_1 <= e;
            end if;
        end if;
    end process;

fb_reg2:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (active low)
            e_2 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  -- rising clock edge           
            if (vin_i = '1') then
                e_2 <= e_1;
            end if;
        end if;
    end process;

ff2_reg1:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (
            f_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  
            if (vin_i = '1') then
                f_1 <= f;
            end if;
        end if;
    end process;

ff2_reg2:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (
            f_2 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  
            if (vin_i = '1') then
                f_2 <= f_1;
            end if;
        end if;
    end process;


ff2_reg3:
    process (CLK, RST_n)
    begin
        if (RST_n = '0') then                 -- asynchronous reset (
            g_1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then  
            if (vin_i = '1') then
                g_1 <= g;
            end if;
        end if;
    end process;

--##############################################################
--##################### Implementation #########################
--##############################################################


    -- Multiplication operations with extended bits
    
    --new coefficient: a^2
    a2_ext <= std_logic_vector(signed(a1_i) * signed(a1_i));     

    c_ext <= std_logic_vector(signed(x_1) * signed(a1_i));    
    e_ext <= std_logic_vector(signed(w_2) * signed(a2));
    f_ext <= std_logic_vector(signed(w_1) * signed(b1_i));
    g_ext <= std_logic_vector(signed(w_1) * signed(b0_i));

     

    -- Take just the bit needed
    a2    <= a2_ext(2*NB-2) & a2_ext(2*NB-2 downto SHAMT) & "00000000";
    c     <= c_ext(2*NB-2)  & c_ext(2*NB-2 downto SHAMT)  & "00000000";    
    e     <= e_ext(2*NB-2)  & e_ext(2*NB-2 downto SHAMT)  & "00000000";
    f     <= f_ext(2*NB-2)  & f_ext(2*NB-2 downto SHAMT)  & "00000000";    
    g     <= g_ext(2*NB-2)  & g_ext(2*NB-2 downto SHAMT)  & "00000000";    


    -- Computation at 14 bit
    d      <=  std_logic_vector(signed(x_1) - signed(c_1));
    w      <=  std_logic_vector(signed(d_1) + signed(e_2));
    y_tmp  <=  std_logic_vector(signed(g_1) + signed(f_2));


    -- Output at 13 bit
    y      <= y_tmp(NB-1 downto 0);

end behavioral;