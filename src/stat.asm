%ifndef STAT_ASM
    %define STAT_ASM

    %include "syscall.asm"

    %define O_RDONLY 0000000000

    section .text
    open:
        call    sys_open
        ret

    read:
        call    sys_read
        ret

    close:
        call    sys_close
        ret

%endif
