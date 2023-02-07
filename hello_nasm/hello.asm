global _start

SYS_WRITE equ 1
SYS_EXIT equ 60
STDOUT equ 1

section .data
msg db "Hello World!", 10
msg_len equ $-msg

SECTION .text

_start:
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  ; mov rsi, msg
  lea rsi, [msg]
  mov rdx, msg_len
  syscall

  push rax
  mov rax, SYS_EXIT
  pop rdi
  sub rdi, msg_len
  syscall
