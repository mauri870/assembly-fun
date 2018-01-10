;
; A simple program to simulate the behavior of the GNU coreutils true
;

%include "io.asm"

section .text
global _start
_start:
    mov     rdi, NULL
    call    exit
