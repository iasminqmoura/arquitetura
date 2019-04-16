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
   
    ;N1 - 0xE4E1C0 (15.000.000)
    ;N2 - 0x989680 (10.000.000)
    ;SOMA - 0x17D7840 (25.000.000)
    
    ;MAPA MEMÓRIA
    ;NÚMERO 1 - 0xE4E1C0
    ;4 - E4 - (número mais significativo)
    MOVLW 0xE4 ;Move o valor para o W
    MOVWF 0x4 ;Move o valor que está no W para o endereço de memória 0x4
    
    ;5 - E1 - (número menos significativo)
    MOVLW 0xE1 ;Move o valor para o W
    MOVWF 0x5 ;Move o valor que está no W para o endereço de memória 0x5
    
    ;6 - C0 - (número mais significativo)
    MOVLW 0xC0 ;Move o valor para o W
    MOVWF 0x6 ;Move o valor que está no W para o endereço de memória 0x6
    ;--------------------------------------------------------------------
    
    ;MAPA MEMÓRIA
    ;NÚMERO 2 - 0x989680
    ;7 - 98 - (número mais significativo)
    MOVLW 0x98 ;Move o valor para o W
    MOVWF 0x7 ;Move o valor que está no W para o endereço de memória 0x7
    
    ;8 - 96 - (número menos significativo)
    MOVLW 0x96 ;Move o valor para o W
    MOVWF 0x8 ;Move o valor que está no W para o endereço de memória 0x8
    
    ;9 - 80 - (número mais significativo)
    MOVLW 0x80 ;Move o valor para o W
    MOVWF 0x9 ;Move o valor que está no W para o endereço de memória 0x9
    ;--------------------------------------------------------------------
    ;RES SOMA - 0x17D7840
    ;0 - 1 (RES) - H 
    ;1 - 7D (RES) - L
    ;2 - 78 (RES) - L
    ;3 - 40 (RES) - L
    ;--------------------------------------------------------------------
    
    ;SOMA - Começa pelo menos significativo
    ; (0x6) + (0x9) -> 0x3
    MOVF 0x06, W ;Move o valor que está no endereço 0x06 para o W
    ADDWF 0x09, W ;Soma o valor que está no endereço 0x09 com o valor que está no W
    MOVWF 0x03 ;Envia o resultado da soma para o endereço 0x03
    ;O status foi modificado - Gerou o Carry
   
    ; (0x5) + (0x8) -> 0x2
    MOVF 0x05, W ;Move o valor que está no endereço 0x05 para o W
    ADDWFC 0x08, W ;Soma o valor que está no endereço 0x08 com o valor que está no W e o carry
    MOVWF 0x02 ;Envia o resultado da soma para o endereço 0x02
    ;O status foi modificado - Gerou o Carry
    
    ;SOMA - parte mais significativa
    ; (0x4) + (0x7) -> 0x1
    MOVF 0x04, W ;Move o valor que está no endereço 0x04 para o W
    ADDWFC 0x07, W ;Soma o valor que está no endereço 0x07 com o valor que está no W e o carry
    MOVWF 0x01 ;Envia o resultado da soma para o endereço 0x01
    
    MOVF 0x00, W ;Move o valor que está no endereço 0x00 para o W
    ADDWFC 0x00, W ;Soma o valor que está no endereço 0x00 com o valor que está no W e o carry
    MOVWF 0x00 ;Envia o resultado da soma para o endereço 0x01
    
    GOTO MainLoop
    
	END