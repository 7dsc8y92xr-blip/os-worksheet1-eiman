%include "asm_io.inc"

segment .data
    x       dd 5          ; first integer
    y       dd 7          ; second integer
    result  dd 0          ; to store the sum

segment .text
    global asm_main

asm_main:
    ; standard function setup
    enter 0, 0
    pusha

    ; load x and add y
    mov     eax, [x]
    add     eax, [y]
    mov     [result], eax

    ; print the result
    mov     eax, [result]
    call    print_int
    call    print_nl

    ; exit
    popa
    mov     eax, 0
    leave
    ret
