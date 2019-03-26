
#include <p18f4550.inc>

	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6

    org 0; start code at 0



CODE

Start:
    MOVLW 0xF0
    MOVWF TRISD
    
MainLoop:

	 MOVLW 0x03
	 MOVWF PORTD
	    
	 MOVLW 0x06
	 MOVWF PORTD
	 
	 MOVLW 0x0E
	 MOVWF PORTD
	 
	 MOVLW 0x00
	 MOVWF PORTD
	 
	 MOVLW 0x0D
	 MOVWF PORTD
	 
	 MOVLW 0x02
	 MOVWF PORTD
	 
	 MOVLW 0x03
	 MOVWF PORTD

    GOTO MainLoop

	END