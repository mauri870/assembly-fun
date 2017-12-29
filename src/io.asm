%ifndef IO_ASM
    %define IO_ASM

    %include "syscall.asm"
    %include "strings.asm"

    section .text
    print:
        cmp     rdi, NULL
        jz      .ret
        mov     rsi, rdi
        call    strlen
        mov     rdx, rax
        mov     rdi, STDOUT
        call    sys_write

        .ret:
        ret

    println:
        call    print
        mov     rdi, LF
        call    print
        ret

    printInt:
        call    itoa
        mov     rdi, rax
        call    print
        ret

    scanln:
        mov     rdx, rsi
        mov     rsi, rdi
        mov     rdi, STDIN
        call    sys_read
        ret

    scan:
        call    scanln
        mov     rdi, rsi
        call    trimln
        ret

    exit:
        call    sys_exit
        ret

    section .data
        NULL:   equ 0x0
        LN:     equ 0xA
        LF:     db LN, NULL

%endif
