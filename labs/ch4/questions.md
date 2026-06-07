# 8086 Assembly Language — Questions & Answers

---

## Question 1 — Stack Segment Addresses

**Given:** SS = 2000H, SP = 4578H

Find:
- (a) The physical address
- (b) The logical address
- (c) The lower range of the stack segment
- (d) The upper range of the stack segment

### Solution

**(a) Physical Address**

$$Physical = (SS \times 10H) + SP = 20000H + 4578H = 24578H$$

**(b) Logical Address**

$$2000H : 4578H$$

**(c) Lower Range** (offset = 0000H)

$$20000H + 0000H = 20000H$$

**(d) Upper Range** (offset = FFFFH)

$$20000H + FFFFH = 2FFFFH$$

### Summary

| Part | Result |
|------|--------|
| (a) Physical Address | **24578H** |
| (b) Logical Address | **2000H : 4578H** |
| (c) Lower Range | **20000H** |
| (d) Upper Range | **2FFFFH** |

> Any 8086 segment is always **64KB** in size (offset 0000H to FFFFH).

---

## Question 2 — PUSH Operations

**Given:** SP = FF2EH, AX = 3291H, BX = F43CH, CX = 4409H

Find the content of the stack and stack pointer after each instruction:
```
PUSH AX
PUSH BX
PUSH CX
```

### Solution

> **PUSH mechanics:** SP − 2, then High byte → SP+1, Low byte → SP

**After PUSH AX** → SP = **FF2CH**

| Address | Content |
|---------|---------|
| FF2DH | 32H (AH) |
| FF2CH | 91H (AL) |

**After PUSH BX** → SP = **FF2AH**

| Address | Content |
|---------|---------|
| FF2BH | F4H (BH) |
| FF2AH | 3CH (BL) |

**After PUSH CX** → SP = **FF28H**

| Address | Content |
|---------|---------|
| FF29H | 44H (CH) |
| FF28H | 09H (CL) |

### Summary

| Instruction | SP |
|---|---|
| PUSH AX | FF2CH |
| PUSH BX | FF2AH |
| PUSH CX | **FF28H** |

---

## Question 3 — Flags: CF, ZF, AF

Find CF, ZF, and AF for each. Also indicate the result and where it is saved.

### (a) MOV BH, 3FH / ADD BH, 45H

```
  3FH + 45H = 84H
```

- Result = **84H → saved in BH**
- CF = 0 | ZF = 0 | AF = 1

### (b) MOV DX, 4599H / MOV CX, 3458H / ADD CX, DX

```
  3458H + 4599H = 79F1H
```

- Result = **79F1H → saved in CX**
- CF = 0 | ZF = 0 | AF = 1

### (c) MOV AX, 255 / STC / ADC AX, 00

```
  00FFH + 0000H + 1(CF) = 0100H
```

- Result = **0100H → saved in AX**
- CF = 0 | ZF = 0 | AF = 1

### (d) MOV BX, 0FF01H / ADD BL, BH

```
  01H + FFH = 100H → 00H (8-bit overflow)
```

- Result = **00H → saved in BL**
- CF = 1 | ZF = 1 | AF = 1

### (e) MOV CX, 0FFFFH / STC / ADC CX, 00

```
  FFFFH + 0000H + 1(CF) = 10000H → 0000H
```

- Result = **0000H → saved in CX**
- CF = 1 | ZF = 1 | AF = 1

### (f) MOV AH, 0FEH / STC / ADC AH, 00

```
  FEH + 00H + 1(CF) = FFH
```

- Result = **FFH → saved in AH**
- CF = 0 | ZF = 0 | AF = 0

### Summary Table

| | Result | Saved in | CF | ZF | AF |
|---|---|---|---|---|---|
| **(a)** | 84H | BH | 0 | 0 | 1 |
| **(b)** | 79F1H | CX | 0 | 0 | 1 |
| **(c)** | 0100H | AX | 0 | 0 | 1 |
| **(d)** | 00H | BL | 1 | 1 | 1 |
| **(e)** | 0000H | CX | 1 | 1 | 1 |
| **(f)** | FFH | AH | 0 | 0 | 0 |

---

## Question 4 — Fill 256 Bytes with 20H

Write a program to fill the 256 bytes block of memory in the data segment beginning at address BLOCK with the data byte 20H (ASCII space).

---

## Question 5 — Move 100 Bytes from LIST to BLK

Write a program that will move 100 bytes from data table LIST to data table BLK.

---

## Question 6 — Transfer 40 Bytes from DATA1 to DATA2

Write a program to transfer 40 bytes of data from array DATA1 to array DATA2.

---

## Question 7 — Transfer 20 Words from DATA1 to DATA2

Write a program that transfers a block of 20 words of data from array DATA1 to array DATA2.


---

## Question 8 — Store 55H into 100 Memory Locations

Write a program to store byte 55H into 100 memory locations.
