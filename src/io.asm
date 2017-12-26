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
    mov     rdi, LR
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
    LR      db 0xA, 0x0