%ifndef STRINGS_ASM
    %define STRINGS_ASM

    section .text
    strlen:
        push	rcx
        xor     rcx, rcx
        
        next$:
        cmp     [rdi], byte 0
        jz      null$
        inc     rcx
        inc     rdi
        jmp     next$

        null$:
        mov     rax, rcx
        pop     rcx
        ret

    trimln:
        mov     rsi, rdi
        call    strlen
        dec     rax
        cmp     byte [rsi + rax], 0xA
        jz      trim$
        jmp     done$

        trim$:
        mov     byte [rsi + rax], 0
        
        done$:
        inc     rax
        ret

%endif
