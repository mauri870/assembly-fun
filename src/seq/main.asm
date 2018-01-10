;
; A simple program to simulate the behavior of the GNU coreutils seq
;

%include "io.asm"
%include "strings.asm"

section .text
global _start
_start:
    pop     rcx                                 ; argc
    pop     rdi                                 ; argv[0]

    cmp     rcx, 3
    jz      .startEndSeq                        ; provided start and end of sequence
    cmp     rcx, 2
    jz      .normalSeq                          ; provided only end of sequence
    jmp     .exit

    .startEndSeq:
    pop     rdi
    call    atoi
    mov     rbx, rax

    pop     rdi
    call    atoi
    mov     r8, rax
    mov     rcx, rbx
    jmp     .counter

    .normalSeq:
    pop     rdi
    call    atoi
    mov     r8, rax
    mov     rcx, 1

    .counter:
    push    rcx
    mov     rdi, rcx
    call    printInt

    xor     rdi, rdi
    call    println

    pop     rcx
    inc     rcx
    cmp     rcx, r8
    jle     .counter

    .exit:
    mov     rdi, 0
    call    exit

