%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

sys_read:
    mov     rax, SYS_READ
    syscall
    ret

sys_write:
    mov     rax, SYS_WRITE
    syscall
    ret

sys_exit:
    mov     rax, SYS_EXIT
    syscall
    ret
