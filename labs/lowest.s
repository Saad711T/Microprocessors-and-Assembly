.MODEL SMALL
.STACK 100H

.DATA
GRADES  DB    69, 87, 96, 45, 44, 77, 88, 67, 12, 75
N       EQU   10
MSG     DB    'Lowest grade = $'

.CODE
MAIN PROC
        MOV   AX, @DATA
        MOV   DS, AX

        MOV   DX, OFFSET MSG
        MOV   AH, 09H
        INT   21H

        MOV   SI, OFFSET GRADES
        MOV   CX, N                 ; number of grades
        MOV   AL, [SI]              ; assume first grade is the lowest
        INC   SI
        DEC   CX                    ; one element already taken

FINDLOW:
        CMP   AL, [SI]              ; compare current min with next grade
        JBE   SKIP                  ; if AL <= [SI], keep AL
        MOV   AL, [SI]              ; else update the minimum
SKIP:
        INC   SI
        LOOP  FINDLOW

        ;---- AL = lowest grade -> display as two decimal digits ----
        XOR   AH, AH
        MOV   BL, 10
        DIV   BL                    ; AL = tens , AH = ones
        MOV   BX, AX
        MOV   DL, BL
        ADD   DL, '0'
        MOV   AH, 02H
        INT   21H
        MOV   DL, BH
        ADD   DL, '0'
        MOV   AH, 02H
        INT   21H

        MOV   AH, 4CH
        INT   21H
MAIN ENDP
        END   MAIN