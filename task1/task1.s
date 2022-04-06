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

shr ebx, 16
and ebx,0FFh

; CALL PRINTF
mov rdi, format ;arg_1
mov esi, ebx ;arg_2
call printf wrt ..plt ;printf(format, ebx)

; PREPARE RETURN VALUE
mov rax, 0 ;return value from main rax=0

; EPILOG
pop rbp
ret

;=======секция констант===========
section .rodata
format: dd `%08llx\n\0`
;=================================
