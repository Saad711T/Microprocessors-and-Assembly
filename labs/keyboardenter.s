; Write Assembly code to accept "Final" that entered through keyboard

.MODEL SMALL
.STACK 64

.DATA
LETTERS EQU 5

.CODE      
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV CX,5

READ:
MOV AH,01H
INT 21H
LOOP READ


MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
