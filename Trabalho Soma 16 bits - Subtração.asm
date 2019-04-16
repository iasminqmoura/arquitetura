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
   
    ;N1 - 0x112A880 (18.000.000)
    ;N2 - 0xB71B00 (12.000.000)
    ;SUBTRA��O - 0x5B8D80 (25.000.000)
    
    ;MAPA MEM�RIA
    ;N�MERO 1 - 0x112A880
    ;10 - 01 - (n�mero mais significativo)
    MOVLW 0x01 ;Move o valor para o W
    MOVWF 0x10 ;Move o valor que est� no W para o endere�o de mem�ria 0x10
    
    ;11 - 12 - (n�mero menos significativo)
    MOVLW 0x12 ;Move o valor para o W
    MOVWF 0x11 ;Move o valor que est� no W para o endere�o de mem�ria 0x11
    
    ;12 - A8 - (n�mero mais significativo)
    MOVLW 0xA8 ;Move o valor para o W
    MOVWF 0x12 ;Move o valor que est� no W para o endere�o de mem�ria 0x12
    
    ;13 - C0 - (n�mero mais significativo)
    MOVLW 0x80 ;Move o valor para o W
    MOVWF 0x13 ;Move o valor que est� no W para o endere�o de mem�ria 0x13
    ;--------------------------------------------------------------------
    
    ;MAPA MEM�RIA
    ;N�MERO 2 - 0xB71B00
    ;14 - 00 - (n�mero mais significativo)
    MOVLW 0x00 ;Move o valor para o W
    MOVWF 0x14 ;Move o valor que est� no W para o endere�o de mem�ria 0x14
    
    ;15 - B7 - (n�mero menos significativo)
    MOVLW 0xB7 ;Move o valor para o W
    MOVWF 0x15 ;Move o valor que est� no W para o endere�o de mem�ria 0x15
    
    ;16 - 1B - (n�mero mais significativo)
    MOVLW 0x1B ;Move o valor para o W
    MOVWF 0x16 ;Move o valor que est� no W para o endere�o de mem�ria 0x16
    
    ;17 - 00 - (n�mero mais significativo)
    MOVLW 0x00 ;Move o valor para o W
    MOVWF 0x17 ;Move o valor que est� no W para o endere�o de mem�ria 0x17
    ;--------------------------------------------------------------------
    ;RES SUBTRA��O - 0x5B8D80
    ;4 - 00 (RES) - H 
    ;5 - 5B (RES) - L
    ;6 - 8D (RES) - L
    ;7 - 80 (RES) - L
    ;--------------------------------------------------------------------
    
    ;SUBTRA��O - Come�a pelo menos significativo
    ; (0x13) - (0x17) -> 0x7
    MOVF 0x17, W ;Move o valor que est� no endere�o 0x13 para o W
    SUBWF 0x13, W ;Subtrai o valor que est� no endere�o 0x17 com o valor que est� no W
    MOVWF 0x07 ;Envia o resultado da soma para o endere�o 0x07
    ;O status foi modificado - Gerou o Borrow
   
    ; (0x12) - (0x16) -> 0x6
    MOVF 0x16, W ;Move o valor que est� no endere�o 0x16 para o W
    SUBWFB 0x12, W ;Subtrai o valor que est� no endere�o 0x12 com o valor que est� no W e o Borrow
    MOVWF 0x06 ;Envia o resultado da soma para o endere�o 0x06
    ;O status foi modificado - Gerou o Borrow
    
    ; (0x11) - (0x15) -> 0x5
    MOVF 0x15, W ;Move o valor que est� no endere�o 0x15 para o W
    SUBWFB 0x11, W ;Subtrai o valor que est� no endere�o 0x11 com o valor que est� no W e o Borrow
    MOVWF 0x05 ;Envia o resultado da soma para o endere�o 0x05
    ;O status foi modificado - Gerou o Borrow
    
    ;SUBTRA��O - parte mais significativa
    ; (0x10) + (0x14) -> 0x4
    MOVF 0x14, W ;Move o valor que est� no endere�o 0x14 para o W
    SUBWFB 0x10, W ;Subtrai o valor que est� no endere�o 0x10 com o valor que est� no W e o carry
    MOVWF 0x04 ;Envia o resultado da soma para o endere�o 0x04
   
    
    GOTO MainLoop
    
	END