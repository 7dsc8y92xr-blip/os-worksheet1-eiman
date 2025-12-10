; Task 1 – Hard-coded addition (expected output: 10)

%include "asm_io.inc"

segment .data
    num1    dd 2       ; first number
    num2    dd 3       ; second number
    num3    dd 5       ; third number

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha                   ; save registers

    ; -------------------------
    ; Load the three numbers
    ; -------------------------
    mov eax, [num1]         ; eax = 2
    add eax, [num2]         ; eax = 2 + 3
    add eax, [num3]         ; eax = 2 + 3 + 5 = 10

    ; -------------------------
    ; Print result (10)
    ; -------------------------
    call print_int
    call print_nl

    ; -------------------------
    ; Exit
    ; -------------------------
    popa
    mov eax, 0
    leave
    ret
