.MODEL SMALL
.STACK 100H
.DATA
    GRADES  DB 69,87,96,45,75
    COUNT   EQU 5
    HIGHEST DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT-1       ; compare 4 times
    MOV SI, OFFSET GRADES
    MOV AL, [SI]          ; assume first is highest
FIND_MAX:
    INC SI
    CMP AL, [SI]
    JAE SKIP             ; if AL >= next, keep AL
    MOV AL, [SI]         ; else update highest
SKIP:
    LOOP FIND_MAX
    MOV HIGHEST, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN