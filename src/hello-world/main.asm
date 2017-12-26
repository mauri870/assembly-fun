;
; A simple hello world program using the linux kernel system calls
;

%include "io.asm"

section .text
global _start
_start:
    mov 	rdi, msg
    call 	println

    mov     rdi, 0
    call    exit

section .data
msg			db 'Hello World!', 0x0

