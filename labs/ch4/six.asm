.MODEL SMALL
.DATA
    DATA1 DB 40 DUP(?)      ; source array
    DATA2 DB 40 DUP(?)      ; destination array

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize DS

    LEA SI, DATA1           ; SI = source (DATA1)
    LEA DI, DATA2           ; DI = destination (DATA2)
    MOV CX, 40              ; counter = 40 bytes



LOOP1:
    MOV AL, [SI]            ; load byte from DATA1
    MOV [DI], AL            ; store byte to DATA2
    INC SI                  ; next source byte
    INC DI                  ; next destination byte
    LOOP LOOP1              ; repeat until CX = 0

    MOV AX, 4C00H
    INT 21H                 ; exit
MAIN ENDP
END MAIN