;=======секция кода===============
section .text
extern printf ;библиотечная функция
global main
main: ;точка входа

; PROLOG
push rbp
mov rbp, rsp

; GET CPUID in EAX
mov eax, 7
mov ecx, 0
cpuid

test ebx, 3
je BMI1_false
jne BMI1_true

; PREPARE RETURN VALUE
mov rax, 0 ;return value from main rax=0

;EPILOG
pop rbp
ret

BMI1_true:
mov rdi, msg1 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp BMI2
ret

BMI1_false:
mov rdi, msg0 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp BMI2
ret

BMI2:
mov rax, 0
mov eax, 7
mov ecx, 0
cpuid;

test ebx, 8
jnz BMI2_true
jz BMI2_false
ret

BMI2_false:
mov rdi, msg2 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp ADX
ret

BMI2_true:
mov rdi, msg3 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
jmp ADX
ret

ADX:
mov eax, 7
mov ecx, 0
cpuid

test ebx, 19
je ADX_false
jne ADX_true

ADX_false:
mov rdi, msg4 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
ret

ADX_true:
mov rdi, msg5 ;arg_1
xor eax, eax ;arg_2
call printf wrt ..plt 
ret

;=======секция констант===========
section .rodata
msg0: db "BMI1: false", 0x0a, 0 
msg1: db "BMI1: true", 0x0a, 0 
msg2: db "BMI2: false", 0x0a, 0 
msg3: db "BMI2: true", 0x0a, 0 
msg4: db "ADX: false", 0x0a, 0 
msg5: db "ADX: true", 0x0a, 0 
;=================================
