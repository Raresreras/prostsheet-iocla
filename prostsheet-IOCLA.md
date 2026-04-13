# Prostsheet IOCLA

Studentul mediocru, care a avut media mai mica la USO decat la analiza, loveste din nou cu un cheatsheet mai praf decat precedentul. 

Un pas mic pentru procesor (8 bytes), un salt imens pentru restantieri.

P.S. Nu deschideti niciun Pull Request ca devine acest repo platforma colaborativa si nu va mai lasa la partial cu prostsheet-ul.

# Comenzi

## Tools
nm					- afiseaza adresa simbolurilor
nm -n 				- afiseaza adresa simbolurilor sortate
	.data - D
	.bss - B
	.rodata - R

objdump -d        	- dezasambleaza cod masina
objdump -d -S     	- dezasambleaza cod masina + adauga cod C (trebuie -g)
objdump -t  		- afisare tabel simboluri
objdump -s			- continut hexa al sectiunilor
objdump -t <binary> | grep -E '\.data|\.rodata|\.bss'

## Pwndbg
run / r
continue / c
next / n
step / s
nexti / ni
stepi / si
finish
until <addr>
jump <addr>

break / b <addr/func>
watch <expr>
delete / d <num>
disable / enable <num>

context
regs
stack <n>
hexdump <addr>

info functions / variables / files

# Assembly

## Inmultire

Byte

    mov al, byte [num1]
    mov bl, byte [num2]
    mul bl

Word

    mov ax, word [num1_w]
    mov bx, word [num2_w]
    mul bx

Double

    mov eax, dword [num1_d]
    mov ebx, dword [num2_d]
    mul ebx

Quad

    mov rax, qword [num1_q]
    mov rbx, qword [num2_q]
    mul rbx

## Impartire

Word/byte

	mov al, byte [dividend1]
	mov bl, byte [divisor1]
	div bl

    xor rbx, rbx
    mov bl, al
    PRINTF64 `Quotient: %hhu\n\x0`, rbx

    xor rbx, rbx
    mov bl, ah
    PRINTF64 `Remainder: %hhu\n\x0`, rbx

Doubleword/word

    mov eax, dword [dividend2]
    mov dx, ax
    shr eax, 16
    xchg ax, dx 

    mov bx, word [divisor2]
    div bx

    mov bx, ax
    PRINTF64 `Quotient: %hu\n\x0`, rbx

    xor rbx, rbx
    mov bx, dx
    PRINTF64 `Remainder: %hu\n\x0`, rbx 

Quadword/doubleword

    mov rax, qword [dividend3]
    mov edx, eax
    shr rax, 32
    xchg eax, edx

    mov ebx, dword [divisor3]
    div ebx

    xor rbx, rbx
    mov ebx, eax
    PRINTF64 `Quotient: %u\n\x0`, rbx

    xor rbx, rbx
    mov ebx, edx
    PRINTF64 `Remainder: %u\n\x0`, rbx 

Doublequadword/quadword

    mov rax, qword [dividend4]
    mov rdx, qword [dividend4 + 8]

    xor rbx, rbx
    mov rbx, qword [divisor4]
    div rbx

    xor rbx, rbx
    mov rbx, rax
    PRINTF64 `Quotient: %lu\n\x0`, rbx

    xor rbx, rbx
    mov rbx, rdx
    PRINTF64 `Remainder: %lu\n\0`, rbx

## Comparare

## Structuri

## Apelare functie
Pentru a apela o functie folosim urmatorul cod
call <functie>

## Strings

### String copy
Acest cod copiaza 8 octeti din source in dest

	lea rdi, [rel dest]
	lea rsi, [rel source]

	mov rcx, 8 ; 8 bytes
	rep movsb

