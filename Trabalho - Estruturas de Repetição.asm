
#include <p18f4550.inc>

	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6

    org 0; start code at 0
    x equ 0x00



CODE
    
Start:

   BCF TRISD, 0

MainLoop:
   
   MOVLW 0x07
   MOVWF 0x01
   MOVLW 0x00
   
   FOR: 
    
   ADDLW 0x01
   CPFSGT 0x01, 0
   
   GOTO Ex2
   
   GOTO FOR
   
   Ex2:    
   MOVLW 0x07
   MOVWF 0x02
   MOVLW 0x01
  
   FOR2:
   SUBWF 0x02,1
   CPFSGT 0x02,0
    
   GOTO Ex3
   GOTO FOR2
    
   Ex3:
   MOVLW 0x10
   MOVWF TRISD
   
   WHILE1:
   CPFSEQ PORTD
   GOTO Ex4
   
   BSF PORTD, 0
   BCF PORTD, 0
   GOTO WHILE1
  
   MOVLW PORTD
  
   Ex4:
   MOVLW 0x30
   MOVWF TRISD
   
   While2:
    
   MOVLW 0x30
   CPFSEQ PORTD
   GOTO Comp2
   GOTO Acende
     
   Comp2:
   MOVLW 0x10
   CPFSEQ PORTD
   GOTO Comp3
   GOTO Acende
   
   Comp3:
   MOVLW 0x20
   CPFSEQ PORTD
   GOTO While2
   GOTO Acende
   
   Acende:
   BSF PORTD, 0
   BCF PORTD, 0
   GOTO While2
    
   Fim:
    
   GOTO MainLoop

	END