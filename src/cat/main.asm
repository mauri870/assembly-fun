;
; A simple program to simulate the behavior of the GNU cat utility
;

%include "io.asm"
%include "stat.asm"
%include "syscall.asm"

%define BUF_SIZE 4096

section .text
global _start
_start:
    pop     rdi             ; argc
    pop     rdi             ; argv[0]
    pop     rdi             ; argv[1] - file to read from

    mov     rdx, O_RDONLY
    call    open

    .read:
    push    rax             ; push rax to preserve the fd

    mov     rdi, rax
    mov     rsi, buffer
    mov     rdx, BUF_SIZE
    call    read

    cmp     rax, NULL
    jle     .exit

    mov     rdi, STDOUT
    mov     rsi, buffer
    mov     rdx, rax
    call    sys_write

    pop     rax             ; pop fd into rax
    jmp     .read

    .exit:
    pop     rax
    mov     rdi, rax
    call    close

    mov     rdi, 0
    call    exit

section .bss
    buffer: resb BUF_SIZE

