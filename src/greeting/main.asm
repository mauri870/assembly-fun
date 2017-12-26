;
; A simple program that asks the user for their name and greets them with their name
;

%include "io.asm"

section .text
global _start
_start:
    mov     rdi, input
    mov     rsi, len
    call    scan

    mov     rdi, msg
    call    print

    mov     rdi, input
    call    println

    mov     rdi, 0
    call    exit

section .data
    len     equ 255
    msg     db 'Hello ', 0x0

section .bss
    input   resb len

