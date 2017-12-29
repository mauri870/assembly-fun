;
; A simple program to simulate the coreutils true
;

%include "io.asm"

section .text
global _start
_start:
    mov     rdi, NULL
    call    exit
