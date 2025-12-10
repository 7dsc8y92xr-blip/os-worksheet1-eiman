; task2_1.asm - Task 2 (part 1)
; Ask for a number of times (50–99),
; if valid, print "Welcome, Eiman!" that many times,
; otherwise print error.

%include "asm_io.inc"

segment .data
ask_times   db "How many times to print the welcome message (50-99)? ", 0
msg_small   db "Error: number is too small.", 0
msg_large   db "Error: number is too large.", 0
welcome_msg db "Welcome, Eiman!", 0

segment .bss
count       resd 1

segment .text
global asm_main
asm_main:

    pusha

    ; Ask for number
    mov eax, ask_times
    call print_string
    call read_int
    mov [count], eax

    mov ebx, [count]

    cmp ebx, 50
    jl too_small

    cmp ebx, 99
    jg too_large

print_loop:
    mov eax, welcome_msg
    call print_string
    call print_nl

    dec ebx
    jnz print_loop
    jmp done

too_small:
    mov eax, msg_small
    call print_string
    call print_nl
    jmp done

too_large:
    mov eax, msg_large
    call print_string
    call print_nl

done:
    popa
    ret
