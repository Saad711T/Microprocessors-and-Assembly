.MODEL SMALL
.STACK 100H
.DATA
    NUMBER DW 1234H       ; example value
    ZEROS  DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUMBER
    MOV CX, 16           ; 16 bits to test
    MOV BL, 0            ; zero counter
COUNT_LOOP:
    SHL AX, 1            ; push MSB into CF
    JC  NEXT            ; if CF=1, bit was 1
    INC BL             ; else it was 0, count it
NEXT:
    LOOP COUNT_LOOP
    MOV ZEROS, BL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN