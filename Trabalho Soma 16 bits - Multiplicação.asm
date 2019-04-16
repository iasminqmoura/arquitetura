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
   
    ;N1 - 0x64
    ;N2 - 0x14
    
    MOVLW 0x64 ;Move o valor para o W
    MULLW 0x14 ;0x14 * W
    
    MOVFF PRODH, 0x08
    MOVFF PRODL, 0x09
    
    
    GOTO MainLoop
    
	END