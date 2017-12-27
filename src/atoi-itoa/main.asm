;
; A simple program to convert a string into an integer and vice-versa
;

%include "io.asm"
%include "strings.asm"

section .text
global _start
_start:
    mov     rdi, number
    call    itoa

    mov     rbx, rax

    mov     rdi, rbx
    call    println

    mov     rdi, rbx
    call    atoi

    mov     rdi, rax
    call    exit

section .data
    number  equ 100
