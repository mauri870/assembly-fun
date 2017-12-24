%include "syscall.asm"

section .text
global _start
_start:
	mov 	rdi, STDOUT
	mov 	rsi, msg
	mov 	rdx, msg_size
	call 	sys_write

	mov		rdi, 0
	mov		rax, 60
	syscall

section .data
msg 		db 'Hello World!',0xA
msg_size 	equ $ - msg

