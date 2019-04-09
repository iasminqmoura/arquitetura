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
    MOVLW 0xC4
    ADDLW 0x41
    MOVWF 0x00
    
    MOVLW 0x38
    ADDLW 0x4D
    MOVWF 0x01
    
    MOVLW 0xFF
    ADDLW 0x01
    MOVWF 0x02
    
    MOVLW 0x0F
    ADDLW 0xF1
    MOVWF 0x03
    
    
    MOVLW 0x9C
    ADDLW 0xE2
    MOVWF 0x04
    
    GOTO MainLoop

	END