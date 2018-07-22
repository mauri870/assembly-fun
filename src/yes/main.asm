;
; A simple program to simulate the behavior of the GNU coreutils yes
;
; ./bin/yes | pv -r /dev/null has the same performance as the coreutils yes on my machine
;

%include "stat.asm"
%include "io.asm"

; Buffer size needs to be page size aligned for better performance
%define BUF_SIZE 4096

section .text
global _start
_start:
    mov     rdi, STDOUT
    mov     rsi, buffer
    mov     rdx, BUF_SIZE

    .loop:
    call    write
    jmp     .loop

section .data
    buffer: times BUF_SIZE db 'y', LN, NULL

