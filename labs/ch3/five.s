.MODEL SMALL
.STACK 100H
.DATA
    BYTE1  DB 230
    BYTE2  DB 100
    WORD1  DW 9998
    WORD2  DW 300
    DWORDV DD 100000
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (1a) byte x byte  -> AX
    MOV AL, BYTE1
    MUL BYTE2                 ; AX = 23000

    ; (1b) byte x word  -> DX:AX
    MOV AL, BYTE1
    MOV AH, 0                 ; zero-extend byte1 to a word
    MUL WORD1                 ; DX:AX = 2,299,540

    ; (1c) word x word  -> DX:AX
    MOV AX, WORD1
    MUL WORD2                 ; DX:AX = 2,999,400

    ; (2a) byte / byte
    MOV AX, 0
    MOV AL, BYTE1
    DIV BYTE2                 ; AL=2 (quotient), AH=30 (remainder)

    ; (2b) word / word
    MOV DX, 0
    MOV AX, WORD1
    DIV WORD2                 ; AX=33 (quotient), DX=98 (remainder)

    ; (2c) doubleword / byte1  (use a word divisor to avoid overflow)
    MOV AX, WORD PTR DWORDV
    MOV DX, WORD PTR DWORDV+2 ; DX:AX = 100000
    MOV BL, BYTE1
    MOV BH, 0                 ; BX = 230
    DIV BX                    ; AX=434 (quotient), DX=180 (remainder)

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN