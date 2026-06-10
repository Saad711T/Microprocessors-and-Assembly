.MODEL SMALL
.STACK 100H
.DATA
    GRADES DB 69,87,96,45,44,77,88,67,12,75
    COUNT  EQU 10
    LOWEST DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT-1
    MOV SI, OFFSET GRADES
    MOV AL, [SI]          ; assume first is lowest
FIND_MIN:
    INC SI
    CMP AL, [SI]
    JBE SKIP             ; if AL <= next, keep AL
    MOV AL, [SI]         ; else update lowest
SKIP:
    LOOP FIND_MIN
    MOV LOWEST, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN