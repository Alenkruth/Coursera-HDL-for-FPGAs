LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture RTL of RAM128_32 IS
    type RAM is array (127 DOWNTO 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal ram_signal : RAM;
    --signal o_data : STD_LOGIC_VECTOR(31 downto 0);
    begin 
    process (clock)
    begin 
    if (rising_edge(clock)) then 
        if (wren = '1') then 
            ram_signal (to_integer(unsigned(address))) <= data; 
            q <= data;

        elsif (wren = '0') then 
            q <= ram_signal(to_integer(unsigned(address)));

        end if; 
    end if;
    --q <= o_data;
    end process;
end architecture RTL;
