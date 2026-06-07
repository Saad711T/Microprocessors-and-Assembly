.MODEL SMALL
.DATA
    DATA1 DW 20 DUP(?)      ; source array (20 words)
    DATA2 DW 20 DUP(?)      ; destination array (20 words)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize DS

    LEA SI, DATA1           ; SI = source (DATA1)
    LEA DI, DATA2           ; DI = destination (DATA2)
    MOV CX, 20              ; counter = 20 words

LOOP1:
    MOV AX, [SI]            ; load WORD from DATA1
    MOV [DI], AX            ; store WORD to DATA2
    ADD SI, 2               ; next source word (+2 bytes)
    ADD DI, 2               ; next destination word (+2 bytes)
    LOOP LOOP1              ; repeat until CX = 0

    MOV AX, 4C00H
    INT 21H                 ; exit
MAIN ENDP
END MAIN
