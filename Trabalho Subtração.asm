#include <p18f4550.inc>

	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6

    org 0; start code at 0



CODE

Start:
    
MainLoop:
    
    MOVLW 0xF1
    SUBLW 0x0F
    MOVWF 0x01
    
    
    MOVLW 0xE2
    SUBLW 0x9C
    MOVWF 0x02
    
    GOTO MainLoop

	END