LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT( Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

architecture behavioral of ALU is  
begin 
  alu : process (Op_code,A,B)
    begin
    case Op_code is 
	  when "000" => Y <= A;
	  when "001" => Y <= A + B;
	  when "010" => Y <= A - B;
	  when "011" => Y <= A and B;
	  when "100" => Y <= A or B;
	  when "101" => Y <= A + "1";
	  when "110" => Y <= A - "1";
	  when "111" => Y <= B;
	  when others => Y <= x"00000000"; -- stupid VHDL does not have a replication operator :|
	end case;
  end process alu;
end behavioral; 



