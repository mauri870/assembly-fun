;
; A simple program to get the version of the current linux kernel
;

%include "io.asm"
%include "system.asm"

section .text
global _start
_start:
    mov     rdi, msg
    call    print

    mov     rdi, utsname
    call    uname

    lea     rdi, [utsname + kernel]
    call    println

    mov     rdi, 0
    call    exit

section .data
    msg     db 'Linux Kernel version: ', NULL
    len_uts equ 65
    kernel  equ len_uts * 2

section .bss
    utsname resb len_uts * 5

