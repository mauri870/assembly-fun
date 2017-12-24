%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_WRITE 1

sys_write:
    mov     rax, SYS_WRITE
    syscall
    ret
