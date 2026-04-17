%include "printf64.asm"

section .data

section .bss

section .text
extern printf
global main

main:
	push rbp
    mov rbp, rsp

    xor rax, rax
    leave
    ret