library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0) := (others => '0');
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);
    begin
    --wrptr <= "000";
	--rdptr <= "000"; 
	process (clk,rst,rden,wren,RdInc,WrInc)
	begin 
	if(rising_edge(clk)) then
	if (rden = '1' and RdInc = '1') then
	rdptr <= rdptr + "1"; 
	DataOut <= fifo(to_integer(rdptr));
	elsif (rden = '1' and RdInc = '0') then
	DataOut <= fifo(to_integer(rdptr));	
	elsif (rden = '0') then 
	DataOut <= "ZZZZZZZZZ";	
	end if;
	
	if (wren = '1' and WrInc = '1') then
	wrptr <= wrptr + "1"; 
	fifo(to_integer(wrptr)) <= DataIn;
	elsif (wren = '1' and WrInc = '0') then
    fifo(to_integer(wrptr)) <= DataIn;		
	end if;
	--elsif (RdInc = '1') then 
	--rdptr <= rdptr + '1';
	--elsif (WrInc = '1') then 
	--wrptr <= wrptr + '1';
	if (RdPtrClr = '1') then
	rdptr <= "000";
	end if;
	
	if (WrPtrClr = '1') then
	wrptr <= "000";
	end if;			
	end if;
	
	if (rst = '1') then 
	DataOut <= "000000000";
	wrptr <= "000";
	rdptr <= "000";
	end if;
    --DataOut <= dmuxout;
    end process;
end architecture RTL;
