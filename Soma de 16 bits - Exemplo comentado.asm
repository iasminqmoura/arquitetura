
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
   
    ;N1 - 0x2DD1
    ;N2 - 0x28C0
    ;SOMA - 0x5691
    
    ;MAPA MEM
    ;0 - 2D - (n�mero mais significativo)
    MOVLW 0x2D ;Move o valor para o W
    MOVWF 0x0 ;Move o valor que est� no W para o endere�o de mem�ria 0x0
    
    ;1 - D1 - (n�mero menos significativo)
    MOVLW 0xD1 ;Move o valor para o W
    MOVWF 0x1 ;Move o valor que est� no W para o endere�o de mem�ria 0x1
    
    ;2 - 28 - (n�mero mais significativo)
    MOVLW 0x28 ;Move o valor para o W
    MOVWF 0x2 ;Move o valor que est� no W para o endere�o de mem�ria 0x2
    
    ;3 - C0 - (n�mero menos significativo)
    MOVLW 0xC0 ;Move o valor para o W
    MOVWF 0x3 ;Move o valor que est� no W para o endere�o de mem�ria 0x3
    
    ;4 - 56 (RES) - H 
    ;5 - 91 (RES) - L
    
    ;SOMA - Come�a pelo menos significativo
    ; (0x1) + (0x3) -> 0x5
    MOVF 0x01, W ;Move o valor que est� no endere�o 0x01 para o W
    ADDWF 0x03, W ;Soma o valor que est� no endere�o 0x03 com o valor que est� no W
    MOVWF 0x05 ;Envia o resultado da soma para o endere�o 0x05
    ;O status foi modificado - Gerou o Carry
    
    ;Tomar cuidado para n�o executar nenhum comando que altere o carry
    
    ;SOMA - parte mais significativa
    ; (0x0) + (0x2) -> 0x4
    MOVF 0x00, W ;Move o valor que est� no endere�o 0x00 para o W
    ADDWFC 0x02, W ;Soma o valor que est� no endere�o 0x02 com o valor que est� no W
    ;� preciso utilizar o comando ADDWFC pois ele levar� em conta o valor do carry na soma
    ;Se for utilizado outro comando, o valor da soma dar� errado
    MOVWF 0x04 ;Envia o resultado da soma para o endere�o 0x04
    
    GOTO MainLoop
    
	END