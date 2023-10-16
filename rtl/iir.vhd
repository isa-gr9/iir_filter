library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;


entity myfilter is
    generic  (NB : integer := 13);
    port (
        CLK, RST_n : in std_logic;
        
        VIN : in std_logic;
        DIN : in std_logic_vector(NB -1 downto 0);
        a1 : in std_logic_vector(NB -1 downto 0);
        b0 : in std_logic_vector(NB -1 downto 0);
        b1 : in std_logic_vector(NB -1 downto 0);

        DOUT : out std_logic_vector(NB -1 downto 0);
        VOUT : out std_logic;

    );
end myfilter;

architecture structural of myfilter is

    signal x : std_logic_vector(NB -1 downto 0);
    signal y : std_logic_vector(NB -1 downto 0);
    signal w : std_logic_vector(NB -1 downto 0);
    signal w_i : std_logic_vector(NB -1 downto 0);
    
    signal a1_i: std_logic_vector(NB -1 downto 0);
    signal b1_i: std_logic_vector(NB -1 downto 0);
    signal b0_i: std_logic_vector(NB -1 downto 0);    

    signal en : std_logic;
    

    begin

        RIN:
  
        process (CLK, RST_n)
        begin
            if (RST_n = '0') then                 -- asynchronous reset (active low)
                x <= (others => '0');
            elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
                x <= DIN;
            end if;
        end process;


        AB:
  
        process (CLK, RST_n)
        begin
            if (RST_n = '0') then                 -- asynchronous reset (active low)
                a1_i <= (others => '0');
                b0_i <= (others => '0');
                b1_i <= (others => '0');
            elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
                a1_i <= a1
                b0_i <= b0
                b1_i <= b1
            end if;
        end process


        R1:
  
        process (CLK, RST_n)
        begin
            if (RST_n = '0') then                 -- asynchronous reset (active low)
                w_i <= (others => '0');
            elsif (en = '1' and Clk'event and CLK = '1') then  -- rising clock edge           
                w_i <= w;
            end if;
        end process;
    
        
        fb:
        process(CLK)
            begin
                w <= (w_i * a1) + x;
            
        end process;

        ff:
        process(CLK)
            begin
                y <= (w_i * b1) + w*b0;
        end process;

        ROUT:
  
        process (CLK, RST_n)
        begin
            if (RST_n = '0') then                 -- asynchronous reset (active low)
                DOUT <= (others => '0');
            elsif (VIN='1' and CLK'event and CLK = '1') then  -- rising clock edge           
                DOUT <= y;
                VOUT <= '1';
            end if;
        end process;


end structural;