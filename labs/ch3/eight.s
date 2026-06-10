.MODEL SMALL
.STACK 100H
.DATA
    DATA1 DB "FACULTY of COMPUTERS & Information Technology"
    LEN   EQU $ - DATA1
    DATA2 DB LEN DUP(?), '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, LEN
    MOV SI, OFFSET DATA1
    MOV DI, OFFSET DATA2
CONVERT:
    MOV AL, [SI]
    CMP AL, 'A'          ; below 'A'? not uppercase
    JB  STORE
    CMP AL, 'Z'          ; above 'Z'? not uppercase
    JA  STORE
    ADD AL, 20H          ; convert to lowercase
STORE:
    MOV [DI], AL
    INC SI
    INC DI
    LOOP CONVERT

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN