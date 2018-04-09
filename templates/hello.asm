; File: hello.nasm
; Author: NiAllen Macy

global main

section .text

main:
	; Print msg
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, msglen
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

section .data
	msg: db "Hello!",0xa
	msglen equ $-msg
