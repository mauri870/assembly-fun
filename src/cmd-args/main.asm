;
; A simple program to display the command line arguments used
;

%include "io.asm"

section .text
global _start
_start:
    pop     rcx             ; argc

    .next:
    cmp     rcx, NULL
    jz      .exit

    pop     rdi
    cmp     rdi, NULL
    jz      .exit
    call    println

    dec     rcx
    jmp     .next

    .exit:
    xor     rdi, rdi
    call    exit
