global main

extern printf

SYS_EXIT equ 60 ; for 64-bit, for 32 bit, it's 0x80

SECTION .data
msg db "Hello World!", 10, 0
msg_len equ $-msg

SECTION .text
main:
  push rbp ; stack align - 16-byte alignment
  lea rdi, [msg]
  xor rax, rax
  call printf
  sub rax, msg_len
  mov rdi, rax
  mov rax, SYS_EXIT
  syscall

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
