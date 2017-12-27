%ifndef SYSTEM_ASM
    %define SYSTEM_ASM

    %include "syscall.asm"

    section .text
    uname:
        call    sys_uname
        ret

%endif
