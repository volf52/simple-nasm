global print_hello

extern printf

SECTION .data
msg db "hello makefile", 10, 0
msg_len equ $-msg

SECTION .text
print_hello:
  ; https://www.mourtada.se/calling-printf-from-the-c-standard-library-in-assembly/
  push rbp ; align stack to 16-byte
  lea rdi, [msg]
  xor rax, rax
  call printf
  inc rax ; null byte
  sub rax, msg_len

  pop rbp
  ret
