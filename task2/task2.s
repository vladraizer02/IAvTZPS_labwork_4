;=======секция кода===============
section .text
extern printf ;библиотечная функция
global main
main: ;точка входа

; PROLOG
push rbp
mov rbp, rsp

; GET CPUID in EAX
mov eax, 1
cpuid

test ecx, 25
je AES_false
jne AES_true

; PREPARE RETURN VALUE
mov rax, 0 ;return value from main rax=0

;EPILOG
pop rbp
ret

AES_true:
mov rdi, msg1 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SHA
ret

AES_false:
mov rdi, msg0 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SHA
ret

SHA:
mov rax, 0
mov eax, 7
mov ecx, 0
cpuid;

test ebx, 29
jnz SHA_true
jz SHA_false
ret

SHA_false:
mov rdi, msg2 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp RDSEED
ret

SHA_true:
mov rdi, msg3 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp RDSEED
ret

RDSEED:
mov eax, 1
cpuid

test ecx, 30
je RDSEED_false
jne RDSEED_true

RDSEED_false:
mov rdi, msg4 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
ret

RDSEED_true:
mov rdi, msg5 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
ret

;=======секция констант===========
section .rodata
msg0: db "AES: false", 0x0a, 0 
msg1: db "AES: true", 0x0a, 0 
msg2: db "SHA: false", 0x0a, 0 
msg3: db "SHA: true", 0x0a, 0 
msg4: db "RDSEED: false", 0x0a, 0 
msg5: db "RDSEED: true", 0x0a, 0 
;=================================
