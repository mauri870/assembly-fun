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
        lea     rsi, [buf+10]
        mov     rcx, 10
        mov     [rbp-4], dword NULL

        .loop:
        xor     rdx, rdx
        idiv    rcx
        add     rdx, 0x30
        dec     rsi
        mov     byte [rsi], dl
        inc     dword [rbp-4]

        cmp     rax,0
        jnz     .loop

        mov     rax, rsi
        mov     rcx, [rbp-4]

        leave
        ret

    atoi:
        push    rbx
        xor     rax, rax
        xor     rcx, rcx

        .loop:
        xor     rbx, rbx
        mov     bl, [rdi+rcx]
        cmp     bl, 48              ; char value 0
        jl      .done
        cmp     bl, 57              ; char value 9
        jg      .done
        cmp     bl, LN              ; new line char
        je      .done
        cmp     bl, NULL            ; end of string char
        jz      .done

        sub     bl, 48
        add     rax, rbx
        mov     rbx, 10
        mul     rbx
        inc     rcx
        jmp     .loop

        .done:
        mov     rbx, 10
        div     ebx
        pop     rbx
        ret

    section .bss
        buf     resb 10

%endif
