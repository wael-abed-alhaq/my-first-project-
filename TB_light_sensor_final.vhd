library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity light_sensor_TB_final is 
end entity;

architecture light_sensor_TB_final_arc of light_sensor_TB_final is 



component sensor_light  is
		port( digital_in: in std_logic;
			 LED_output: out std_logic );
	end component ;

signal digital_in,LED_output: std_logic;
signal correct :std_logic ;

begin 
DUT : sensor_light port map(digital_in => digital_in,
						LED_output =>LED_output);
						
						
						
SDU: process
	begin 
	 digital_in<='1';
	 wait for 280 ns ;
	 digital_in<='0';
	 wait for 100 ns ;
	 digital_in<='1';
	 wait for 70 ns ;
	 digital_in<='0';
	 wait;
	end process SDU;
	
checker : process --(digital_in,LED_output)
	  begin
		correct <= '1';
		if digital_in = '0' then
		wait for 1 ns;
			if LED_output /='0' then 
			correct<='0';
			else 
			correct<='1';
			end if;
			
	    elsif digital_in='1' then
		wait for 1 ns;		
		    if LED_output /='1' then 
			correct<='0';
			else 
			correct<='1';
			end if;
		end if;
        wait on digital_in,LED_output;
		assert correct = '1' report "Error" severity ERROR;--if correct is not 1 so report error
	end process checker;
end architecture;