%ifndef STRINGS_ASM
    %define STRINGS_ASM

    %include "io.asm"

    section .text
    strncpy:
        cld
        rep movsb
        ret
    strlen:
        mov     rax, NULL
        mov     rcx, -1
        cld

        repne   scasb
        not     rcx
        mov     rax, rcx
        ret

    trimln:
        mov     rsi, rdi
        call    strlen
        dec     rax
        mov     bl, [LF]
        cmp     byte [rsi + rax], bl
        jnz     .done

        mov     byte [rsi + rax], NULL

        .done:
        inc     rax
        ret

    itoa:
        enter   4, 0
        mov     rax, rdi
        lea     r8, [buf+10]
        mov     rcx, 10
        mov     [rbp-4], dword NULL

        .loop:
        xor     rdx, rdx
        idiv    rcx
        add     rdx, 0x30
        dec     r8
        mov     byte [r8], dl
        inc     dword [rbp-4]

        cmp     rax,0
        jnz     .loop

        mov     rax, r8
        mov     rcx, [rbp-4]

        leave
        ret

    atoi:
        mov     rax, NULL
        mov     rcx, 10

        .loop:
        mov     r8, [rdi]
        cmp     r8, NULL
        jz      .done

        mul     rcx
        sub     r8, 0x30
        add     rax, r8
        inc     rdi
        jmp     .loop

        .done:
        ret

    section .bss
        buf     resb 10

%endif
