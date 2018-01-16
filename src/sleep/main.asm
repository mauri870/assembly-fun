;
; A simple program to simulate the behavior of the GNU coreutils sleep
;

%include "io.asm"
%include "time.asm"
%include "strings.asm"

section .text
global _start
_start:
    pop     rcx                             ; argc

    cmp     rcx, 2
    jnz     .exit

    pop     rdi                             ; argv[0]
    pop     rdi                             ; argv[1] - seconds as string
    call    atoi

    mov     dword [timespec.tv_sec], eax    ; seconds
    mov     dword [timespec.tv_nsec], NULL  ; nanoseconds
    lea     rdi, [timespec]
    xor     rsi, rsi                        ; remaining sleep time after interruption is written to the address pointed by rsi
    call    nanosleep

    lea     rdi, [msg]
    call    println

    .exit:
    mov     rdi, 0
    call    exit

section .data
    msg: db "Wake up and die", NULL

section .bss
    ; https://github.com/torvalds/linux/blob/v4.14/include/uapi/linux/time.h#L10-L13
    timespec:
        .tv_sec resw 1                     ; long seconds
        .tv_nsec resw 1                    ; long nanoseconds
