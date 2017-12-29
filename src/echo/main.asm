;
; A simple program to simulate the coreutils echo
;

%include "io.asm"

section .text
global _start
_start:
    pop     rcx         ; argc

    cmp     rcx, 1
    jle     .exit

    pop     rdi         ; argc[0]
    pop     rdi         ; argc[1]

    .next:
    call    print

    pop     rdi
    cmp     rdi, NULL
    jz      .newline

    push    rdi
    call    printSpace
    pop     rdi

    jmp     .next

    .newline:
    xor     rdi, rdi
    call    println

    .exit:
    mov     rdi, 0
    call    exit

printSpace:
    lea     rdi, [space]
    call    print
    ret

section .data
    space:  db 0x20
