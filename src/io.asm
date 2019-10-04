%ifndef IO_ASM
    %define IO_ASM

    %include "syscall.asm"
    %include "strings.asm"
    %include "stat.asm"

    ; Buffer size needs to be page size aligned for better performance
    %define BUF_SIZE 8192

    section .text
    print:
        cmp     rdi, NULL
        jz      .ret
        mov     rsi, rdi
        call    strlen
        mov     rdx, rax
        mov     rdi, STDOUT
        call    write

        .ret:
        ret

    println:
        call    print
        lea     rdi, [LF]
        call    print
        ret

    printInt:
        call    itoa
        mov     rdi, rax
        call    print
        ret

    printSpace:
        lea     rdi, [SPACE]
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
        SPACE:  db 0x20

%endif
