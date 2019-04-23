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
   
    ;N1 - 0x07ADE0 (503.264)
    ;N2 - 0x01A1C3 (106.947)
    ;SOMA - 0x094FA3 (610211)
    
    ;MAPA MEM�RIA
    ;N�MERO 1 - 0x07ADE0
    ;3 - 07
    MOVLW 0x07 ;Move o valor para o W
    MOVWF 0x3 ;Move o valor que est� no W para o endere�o de mem�ria
    
    ;4 - AD
    MOVLW 0xAD ;Move o valor para o W
    MOVWF 0x4 ;Move o valor que est� no W para o endere�o de mem�ria
    
    ;5 - E0
    MOVLW 0xE0 ;Move o valor para o W
    MOVWF 0x5 ;Move o valor que est� no W para o endere�o de mem�ria
    ;--------------------------------------------------------------------
    
    ;MAPA MEM�RIA
    ;N�MERO 2 - 0x01A1C3
    ;6 - 01
    MOVLW 0x01 ;Move o valor para o W
    MOVWF 0x6 ;Move o valor que est� no W para o endere�o de mem�ria
    
    ;7 - A1
    MOVLW 0xA1 ;Move o valor para o W
    MOVWF 0x7 ;Move o valor que est� no W para o endere�o de mem�ria
    
    ;8 - C3
    MOVLW 0xC3 ;Move o valor para o W
    MOVWF 0x8 ;Move o valor que est� no W para o endere�o de mem�ria
    ;--------------------------------------------------------------------
    ;RES SOMA - 0x094FA3
    ;0 - 09 (RES) - H 
    ;1 - 4F (RES) - L
    ;2 - A3 (RES) - L
    
    ;--------------------------------------------------------------------
    
    ;SOMA - Come�a pelo menos significativo
    ; (0x5) + (0x8) -> 0x2
    MOVF 0x05, W ;Move o valor que est� no endere�o para o W
    ADDWF 0x08, W ;Soma o valor que est� no endere�o com o valor que est� no W
    MOVWF 0x02 ;Envia o resultado da soma para o endere�o
   
    ; (0x4) + (0x7) -> 0x1
    MOVF 0x04, W ;Move o valor que est� no endere�o para o W
    ADDWFC 0x07, W ;Soma o valor que est� no endere�o com o valor que est� no W e o carry
    MOVWF 0x01 ;Envia o resultado da soma para o endere�o

    ;SOMA - parte mais significativa
    ; (0x3) + (0x6) -> 0x0
    MOVF 0x03, W ;Move o valor que est� no endere�o para o W
    ADDWFC 0x06, W ;Soma o valor que est� no endere�o com o valor que est� no W e o carry
    MOVWF 0x00 ;Envia o resultado da soma para o endere�o
    
    GOTO MainLoop
    
	END