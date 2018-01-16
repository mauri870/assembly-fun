%ifndef TIME_ASM
    %define TIME_ASM

    %include "syscall.asm"

    section .text
    nanosleep:
        call    sys_nanosleep
        ret

%endif
