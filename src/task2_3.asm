; task2_3.asm - Task 2 (part 3)
; Sum the numbers from 1 to N (N entered by the user)

%include "asm_io.inc"

segment .data
ask_n      db "Enter N (1 - 100): ", 0
msg_sum    db "Sum of numbers 1..N is: ", 0
msg_error  db "Invalid number.", 0

segment .bss
n          resd 1
sum_val    resd 1

segment .text
global asm_main

asm_main:
    enter 0, 0
    pusha

    ; ---- Ask for N ----
    mov eax, ask_n
    call print_string
    call read_int
    mov [n], eax

    ; ---- Check range 1–100 ----
    mov ebx, [n]
    cmp ebx, 1
    jl invalid
    cmp ebx, 100
    jg invalid

    ; ---- Compute sum 1..N ----
    mov ecx, 1      ; i = 1
    mov eax, 0      ; sum = 0

sum_loop3:
    cmp ecx, ebx
    jg sum_done3

    add eax, ecx
    inc ecx
    jmp sum_loop3

sum_done3:
    mov [sum_val], eax

    mov eax, msg_sum
    call print_string
    mov eax, [sum_val]
    call print_int
    call print_nl
    jmp finish

invalid:
    mov eax, msg_error
    call print_string
    call print_nl

finish:
    popa
    leave
    ret
