;
; A simple hello world program using the linux kernel system calls
;

%include "syscall.asm"

section .text
global _start
_start:
	mov 	rdi, STDOUT
	mov 	rsi, msg
	mov 	rdx, msg_size
	call 	sys_write

	mov	rdi, 0
	call	sys_exit

section .data
msg 		db 'Hello World!',0xA
msg_size 	equ $ - msg

