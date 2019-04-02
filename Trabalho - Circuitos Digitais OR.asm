
#include <p18f4550.inc>

	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6

    org 0; start code at 0



CODE

Start:
    MOVLW 0xEF
    MOVWF TRISD
    
MainLoop:
    
    
    ;Copia o PORTD para a mem 0
    MOVFF PORTD, 0x00
    
    MOVF 0x00, W
    
    RLNCF WREG
    
    IORWF 0x00, W
    
    RLNCF WREG
    RLNCF WREG
    RLNCF WREG
    
    MOVWF PORTD
    
    GOTO MainLoop

	END