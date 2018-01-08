;
; A simple program to simulate the behavior of the GNU tee utility
;

%include "io.asm"
%include "stat.asm"
%include "syscall.asm"
%include "strings.asm"

%define BUF_SIZE 4096

section .text
global _start
_start:
    pop     rdi                                             ; argc
    pop     rdi                                             ; argv[0]
    pop     rdi                                             ; argv[1] - file to write to

    mov     rsi, O_WRONLY | O_CREAT | O_TRUNC
    mov     rdx, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
    call    open

    mov     r8, rax                                         ; keep fd into callee saved register

    .loop:
    mov     rdi, buffer
    mov     rsi, BUF_SIZE
    call    scanln

    cmp     rax, NULL
    jle     .exit

    push    rax

    ; write to STDOUT
    mov     rdi, STDOUT
    mov     rsi, buffer
    mov     rdx, rax
    call    write

    cmp     rax, NULL
    jle     .exit

    ; write to fd
    pop     rdx
    mov     rdi, r8
    mov     rsi, buffer
    call    write

    cmp     rax, NULL
    jnz     .loop

    .exit:
    ; close fd
    mov     rdi, r8
    call    close

    mov     rdi, 0
    call    exit

section .bss
    buffer: resb BUF_SIZE

