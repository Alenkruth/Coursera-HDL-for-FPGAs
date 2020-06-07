LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture behavioral of AAC2M2P1 is
  signal o_q : std_logic_vector(3 downto 0);
  begin 
  process (CP)
  variable bcat : std_logic_vector(3 downto 0);
  begin 
  bcat := SR & PE & CET & CEP;
  if (rising_edge(CP)) then 
     case bcat is 
       when "0001"|"0010"|"0011"|"0100"|"0101"|"0110"|"0111" => o_q <= "0000";
       when "1000"|"1001"|"1010"|"1011" => o_q <= P;
       when "1111" => o_q <= o_q + x"1";
       when "1100"|"1110" => o_q <= o_q;
       when "1101" => o_q <= o_q;
       when others => o_q <= "0000";
     end case;
  end if;
  end process;
  TC <= CET and (and Q);
  Q <= o_q;
end architecture behavioral;