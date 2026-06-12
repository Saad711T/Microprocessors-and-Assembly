.MODEL SMALL
.STACK 100H

.DATA
NUM     DW    1234H                 ; word to examine (change as you like)
MSG     DB    'Number of zero bits = $'

.CODE
MAIN PROC
        MOV   AX, @DATA
        MOV   DS, AX

        ;---- print the label ----
        MOV   DX, OFFSET MSG
        MOV   AH, 09H
        INT   21H

        ;---- count the zero bits ----
        MOV   AX, NUM               ; load the 16-bit word
        MOV   CX, 16                ; 16 bits to test
        XOR   BL, BL                ; BL = zero counter = 0
COUNT:
        SHL   AX, 1                 ; shift MSB into the Carry Flag
        JC    NEXT                  ; CF = 1 -> bit was 1, skip
        INC   BL                    ; CF = 0 -> bit was 0, count it
NEXT:
        LOOP  COUNT                 ; repeat for all 16 bits

        ;---- display BL as two decimal digits ----
        MOV   AL, BL
        XOR   AH, AH
        MOV   BL, 10
        DIV   BL                    ; AL = tens , AH = ones
        MOV   BX, AX                ; BL = tens , BH = ones
        MOV   DL, BL
        ADD   DL, '0'
        MOV   AH, 02H
        INT   21H
        MOV   DL, BH
        ADD   DL, '0'
        MOV   AH, 02H
        INT   21H

        ;---- exit to DOS ----
        MOV   AH, 4CH
        INT   21H
MAIN ENDP
        END   MAIN