;
; A simple program to simulate the behavior of the GNU yes utility
;
; ./bin/yes | pv -r /dev/null has the same performance as the coreutils yes on my machine
;

%include "syscall.asm"
%include "io.asm"

; Buffer size needs to be page size aligned for better performance
%define BUF_SIZE 4096

section .text
global _start
_start:
    mov     rdi, STDOUT
    mov     rsi, buffer
    mov     rdx, BUF_SIZE * 2

    .loop:
    call    sys_write
    jmp     .loop

section .data
    buffer: times BUF_SIZE db 'y', LN, NULL

