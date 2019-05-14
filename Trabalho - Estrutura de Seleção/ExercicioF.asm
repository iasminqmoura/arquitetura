
#include <p18f4550.inc>

	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6

    org 0; start code at 0
    x equ 0x00



CODE
    BCF TRISD, 0;
Start:
    
MainLoop:
    NOP

    MOVLW 0x32;
    CPFSLT x;
    GOTO NaoMenor;
    GOTO Menor;
    
    Menor:
    BSF PORTD, 0;
    GOTO MainLoop
    
    NaoMenor:
    BCF PORTD, 0
    
    GOTO MainLoop

	END