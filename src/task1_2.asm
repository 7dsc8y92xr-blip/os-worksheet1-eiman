%include "asm_io.inc"

segment .data
prompt1   db "Enter first number: ", 0
prompt2   db "Enter second number: ", 0
prompt3   db "Enter third number: ", 0
resultMsg db "The sum is: ", 0

segment .bss
num1 resd 1
num2 resd 1
num3 resd 1
sum  resd 1

segment .text
global asm_main
asm_main:
    ; standard function setup
    enter 0, 0
    pusha

    ; ----- Read first number -----
    mov eax, prompt1
    call print_string
    call read_int
    mov [num1], eax

    ; ----- Read second number -----
    mov eax, prompt2
    call print_string
    call read_int
    mov [num2], eax

    ; ----- Read third number -----
    mov eax, prompt3
    call print_string
    call read_int
    mov [num3], eax

    ; ----- Calculate sum -----
    mov eax, [num1]
    add eax, [num2]
    add eax, [num3]
    mov [sum], eax

    ; ----- Print result -----
    mov eax, resultMsg
    call print_string

    mov eax, [sum]
    call print_int
    call print_nl

    ; standard function cleanup
    popa
    mov eax, 0       ; return code to C main
    leave
    ret
