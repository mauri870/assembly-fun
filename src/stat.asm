%ifndef STAT_ASM
    %define STAT_ASM

    %include "syscall.asm"

    %define O_RDONLY 00000000
    %define O_WRONLY 00000001
    %define O_RDWR   00000002
    %define O_CREAT  00000100
    %define O_TRUNC  00001000

    %define S_IRWXU  0000700o
    %define S_IRUSR  0000400o
    %define S_IWUSR  0000200o
    %define S_IXUSR  0000100o

    %define S_IRWXG  0000070o
    %define S_IRGRP  0000040o
    %define S_IWGRP  0000020o
    %define S_IXGRP  0000010o

    %define S_IRWXO  0000007o
    %define S_IROTH  0000004o
    %define S_IWOTH  0000002o
    %define S_IXOTH  0000001o

    section .text
    open:
        call    sys_open
        ret

    read:
        call    sys_read
        ret

    write:
        call    sys_write
        ret

    close:
        call    sys_close
        ret

%endif
