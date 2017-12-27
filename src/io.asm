%ifndef IO_ASM
    %define IO_ASM

    %include "syscall.asm"
    %include "strings.asm"

    section .text
    print:
        mov     rsi, rdi
        call    strlen
        mov     rdx, rax
        mov     rdi, STDOUT
        call    sys_write
        ret

    println:
        call    print
        mov     rdi, LF
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
        LF:     db 0xA, NULL

%endif
