# Testing different things with x86_64 NASM

```bash
objdump -t elfexec
ldd elfexec
readelf -a elfexec
```

## Pure ASM

- [Example - Hello World](./hello_nasm/hello.asm)

```bash
nasm -f elf64 -g -F dwarf -o out.o file.asm
ld --fatal-warnings -I /lib64/ld-linux-x86-64.so.2 -o exec out.o
# If you want to strip symbol table
# ld -s --fatal-warnings -I /lib64/ld-linux-x86-64.so.2 -o exec out.o
```

## With GCC/Clang (when calling libc functions like printf)

- [Example](./hello_c)

Instead of ld, run

```bash
gcc -g -Wall -Wextra -pedantic -Werror -no-pie -Wl,--fatal-warnings -o exec out.o
# or
clang -g -Wall -Wextra -pedantic -Werror -no-pie -Wl,--fatal-warnings -o exec out.o
```

## Interop (C + ASM) - Makefile

- [Example](./hello_makefile/)

## Interop (C + ASM) - CMake

- [Example](./hello_cmake/)

## Formatter

- [NasmFMT](https://github.com/yamnikov-oleg/nasmfmt) - Requires Go

Flags: `-ii 4 -ci 36`

## Resources

- https://p403n1x87.github.io/getting-started-with-x86-64-assembly-on-linux.html
- https://www.mourtada.se/calling-printf-from-the-c-standard-library-in-assembly/
- https://www.cs.uaf.edu/courses/cs301/2017-fall/index.html
- https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
- https://aaronbloomfield.github.io/pdr/book/x86-64bit-ccc-chapter.pdf
