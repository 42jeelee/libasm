section .data                   ; data섹션
	msg db "hello world",0x0A   ; 개행문자
    msg_len equ $ - msg

section .text                   ; text섹션
	global _start               ; 전역에서 접근가능

_start:                         ;메인함수
    ; write(1, msg, 12)
	mov rax, 0x2000004          ;맥OS의 syscall write()함수 번호. 아래는 매개변수
	mov rdi, 1
	mov rsi, msg
	mov rdx, msg_len
	syscall                     ;호출

    ; exit(0)
	mov rax, 0x2000001          ;맥OS의 syscall exit()함수. 아래는 매개변수
	mov rdi, 0
	syscall                     ;호출