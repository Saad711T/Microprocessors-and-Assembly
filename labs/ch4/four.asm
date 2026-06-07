.MODEL SMALL
.DATA
    BLOCK DB 256 DUP(?)     ; reserve 256 bytes

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize DS

    LEA DI, BLOCK           ; DI points to start of BLOCK
    MOV AL, 20H             ; data byte (ASCII space)
    MOV CX, 256             ; counter = 256

LOOP1:
    MOV [DI], AL            ; store 20H at current address
    INC DI                  ; move to next byte
    LOOP LOOP1              ; CX-- , repeat until CX=0

    MOV AX, 4C00H
    INT 21H                 ; exit program
MAIN ENDP
END MAIN
