; task2_2.asm - Task 2 (array and sum)
; Defines an array of 100 integers, initializes it to 1..100,
; computes the sum, and prints the result.

%include "asm_io.inc"

segment .data
msg_sum   db "Sum of numbers 1..100 is: ", 0

segment .bss
arr       resd 100      ; 100 integers (4 bytes each)
sum_val   resd 1

segment .text
global asm_main

asm_main:
    enter 0, 0
    pusha

    ; -------- initialize arr[i] = i+1 for i = 0..99 --------
    mov ebx, 0           ; index i
    mov eax, 1           ; current value (1..100)

init_loop:
    cmp ebx, 100
    jge init_done        ; if i >= 100, stop

    mov [arr + ebx*4], eax   ; arr[i] = eax
    inc eax                  ; next value
    inc ebx                  ; i++
    jmp init_loop

init_done:

    ; -------- compute sum of arr[0..99] --------
    mov ebx, 0           ; index i
    mov eax, 0           ; running sum

sum_loop:
    cmp ebx, 100
    jge sum_done

    add eax, [arr + ebx*4]
    inc ebx
    jmp sum_loop

sum_done:
    mov [sum_val], eax

    ; -------- print the result --------
    mov eax, msg_sum
    call print_string

    mov eax, [sum_val]
    call print_int
    call print_nl

    popa
    leave
    ret
