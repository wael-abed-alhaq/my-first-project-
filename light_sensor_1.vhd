library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity sensor_light is 
port (digital_in: in std_logic;
    lED_output: out std_logic
  );
end entity sensor_light;


architecture arc_sensor_LED of sensor_light is
begin
process(digital_in)
 variable lED_output_varible  : std_logic;
  begin
    if (digital_in='0') then 
    lED_output_varible:='0';
     else  
     lED_output_varible :='1';
     end if;
	 lED_output<= lED_output_varible;
  end process;
--lED_output<='1' when digital_in='0' -- turn on the light 
  --              else '1';            -- turn off the light 
  ---hgggyvhvm
end architecture;


