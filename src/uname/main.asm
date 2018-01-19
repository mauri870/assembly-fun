;
; A simple program to get the version of the host's linux kernel
;

%include "io.asm"
%include "system.asm"

section .text
global _start
_start:
    mov     rdi, utsname
    call    uname

    xor     rcx, rcx

    .loop:
    cmp     rcx, len_uts * sz_uts
    jz      .exit

    push    rcx

    lea     rdi, [utsname + rcx]
    call    print

    call    printSpace

    pop     rcx
    add     rcx, len_uts
    jmp     .loop

    .exit:
    xor     rdi, rdi
    call    println

    xor     rdi, rdi
    call    exit

section .data
    len_uts equ 65
    sz_uts  equ 6

section .bss
    ; https://github.com/torvalds/linux/blob/v4.14/include/uapi/linux/utsname.h
    utsname resb len_uts * sz_uts

