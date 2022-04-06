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

test edx, 25
je SSE_false
jne SSE_true

; PREPARE RETURN VALUE
mov rax, 0 ;return value from main rax=0

;EPILOG
pop rbp
ret

SSE_true:
mov rdi, msg1 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SSE2
ret

SSE_false:
mov rdi, msg0 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SSE2
ret

SSE2:
mov eax, 1
cpuid;

test edx, 26
jnz SSE2_true
jz SSE2_false
ret

SSE2_false:
mov rdi, msg2 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SSE3
ret

SSE2_true:
mov rdi, msg3 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp SSE3
ret

SSE3:
mov eax, 1
cpuid

test ecx, 0
je SSE3_false
jne SSE3_true

SSE3_false:
mov rdi, msg4 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSSE3
ret

SSE3_true:
mov rdi, msg5 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSSE3 
ret

SSSE3:
mov eax, 1
cpuid

test ecx, 9
je SSSE3_false
jne SSSE3_true

SSSE3_false:
mov rdi, msg6 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSE4_1 
ret

SSSE3_true:
mov rdi, msg7 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSE4_1 
ret

SSE4_1:
mov eax, 1
cpuid

test ecx, 19
je SSE4_1_false
jne SSE4_1_true

SSE4_1_false:
mov rdi, msg8 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSE4_2 
ret

SSE4_1_true:
mov rdi, msg9 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp SSE4_2 
ret

SSE4_2:
mov eax, 1
cpuid

test ecx, 20
je SSE4_2_false
jne SSE4_2_true

SSE4_2_false:
mov rdi, msg10 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX
ret

SSE4_2_true:
mov rdi, msg11 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX 
ret

AVX:
mov eax, 1
cpuid

test ecx, 28
je AVX_false
jne AVX_true

AVX_false:
mov rdi, msg12 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX2
ret

AVX_true:
mov rdi, msg13 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX2
ret

AVX2:
mov eax, 7
mov ecx, 0
cpuid

test ebx, 5
je AVX2_false
jne AVX2_true

AVX2_false:
mov rdi, msg14 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX512f
ret

AVX2_true:
mov rdi, msg15 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
jmp AVX512f 
ret

AVX512f:
mov eax, 7
mov ecx, 0
cpuid

test ebx, 16
je AVX512f_false
jne AVX512f_true

AVX512f_false:
mov rdi, msg16 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
;jmp SSE4_2 
ret

AVX512f_true:
mov rdi, msg17 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt
;jmp SSE4_2 
ret

;=======секция констант===========
section .rodata
msg0: db "SSE: false", 0x0a, 0 
msg1: db "SSE: true", 0x0a, 0 
msg2: db "SSE2: false", 0x0a, 0 
msg3: db "SSE2: true", 0x0a, 0 
msg4: db "SSE3: false", 0x0a, 0 
msg5: db "SSE3: true", 0x0a, 0 
msg6: db "SSSE3: false", 0x0a, 0 
msg7: db "SSSE3: true", 0x0a, 0 
msg8: db "SSE4.1: false", 0x0a, 0 
msg9: db "SSE4.1: true", 0x0a, 0 
msg10: db "SSE4.2: false", 0x0a, 0 
msg11: db "SSE4.2: true", 0x0a, 0 
msg12: db "AVX: false", 0x0a, 0 
msg13: db "AVX: true", 0x0a, 0 
msg14: db "AVX2: false", 0x0a, 0 
msg15: db "AVX2: true", 0x0a, 0 
msg16: db "AVX512f: false", 0x0a, 0 
msg17: db "AVX512f: true", 0x0a, 0 
;=================================
