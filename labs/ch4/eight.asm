.MODEL SMALL
.DATA
    BLOCK DB 100 DUP(?)     ; 100 memory locations

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize DS

    LEA DI, BLOCK           ; DI = start of BLOCK
    MOV AL, 55H             ; byte to store
    MOV CX, 100             ; counter = 100

LOOP1:
    MOV [DI], AL            ; store 55H
    INC DI                  ; next location
    LOOP LOOP1              ; repeat until CX = 0

    MOV AX, 4C00H
    INT 21H                 ; exit
MAIN ENDP
END MAIN
