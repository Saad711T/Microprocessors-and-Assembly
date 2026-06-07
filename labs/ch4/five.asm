.MODEL SMALL
.DATA
    LIST DB 100 DUP(?)      ; source table
    BLK  DB 100 DUP(?)      ; destination table

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize DS

    LEA SI, LIST            ; SI = source (LIST)
    LEA DI, BLK             ; DI = destination (BLK)
    MOV CX, 100             ; counter = 100 bytes

LOOP1:
    MOV AL, [SI]            ; load byte from LIST
    MOV [DI], AL            ; store byte to BLK
    INC SI                  ; next source byte
    INC DI                  ; next destination byte
    LOOP LOOP1              ; repeat until CX = 0

    MOV AX, 4C00H
    INT 21H                 ; exit
MAIN ENDP
END MAIN
