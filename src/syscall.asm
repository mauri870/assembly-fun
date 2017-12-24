%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_WRITE 1
%define SYS_EXIT 60

sys_write:
    mov     rax, SYS_WRITE
    syscall
    ret

sys_exit:
    mov     rax, SYS_EXIT
    syscall
    ret
