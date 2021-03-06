LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 

ENTITY PWM IS
	PORT(Periodo : IN UNSIGNED (26 DOWNTO 0);
		 Duty_Cicle : IN UNSIGNED (25 DOWNTO 0);
		 sysClock : IN STD_LOGIC;
		 Saida : OUT STD_LOGIC);
END PWM;

ARCHITECTURE structural OF PWM IS
	SIGNAL COUNT_aux : UNSIGNED (25 DOWNTO 0);  
BEGIN
	PROCESS(sysClock,COUNT_aux,Periodo,Duty_Cicle) IS 
	BEGIN
		IF(rising_edge(sysClock)) THEN
			COUNT_aux <= COUNT_aux + 1;
			
		IF(COUNT_aux >= Duty_Cicle) THEN
			Saida <= '0';
		ELSE
			Saida <= '1';
		END IF;
		
		IF(COUNT_aux = Periodo) THEN
			COUNT_aux <= "00000000000000000000000000";
		END IF;
		
		END IF;
	END PROCESS;
END structural;