.MODEL SMALL
.STACK 100H
.DATA
    PAYCHECKS DW 2300,4300,1200,3700,1298,4323,5673,986
    COUNT     EQU 8
    TOTAL     DW ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT          ; counter = 8
    MOV SI, OFFSET PAYCHECKS
    XOR AX, AX             ; accumulator = 0
SUM_LOOP:
    ADD AX, [SI]           ; add current paycheck
    ADD SI, 2              ; move to next word
    LOOP SUM_LOOP
    MOV TOTAL, AX          ; result = 23780

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN