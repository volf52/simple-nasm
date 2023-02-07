AS = nasm

CFLAGS = -std=c99 -no-pie -m64 -g -Wall -Wextra -pedantic -Werror
LDFLAGS = -Wl,--fatal-warnings
ASFLAGS = -f elf64 -g -F dwarf -Werror

C_OBJS = $(patsubst %.c,%.o,$(wildcard *.c))
AS_OBJS = $(patsubst %.asm,%.o,$(wildcard *.asm))
ALL_OBJS = $(filter-out example.o,$(C_OBJS) $(AS_OBJS))

CC_CMD = $(CC) $(CFLAGS) -c -o $@ $<

all: hello
	@./$<

hello: $(ALL_OBJS)
	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(ALL_OBJS)

%.o: %.asm
	@$(AS) $(ASFLAGS) -o $@ $<

%.o: %.c
	@$(CC_CMD)

clean:
	@rm -f *.o hello

test:
	echo "no tests"

.PHONY: all hello clean test
