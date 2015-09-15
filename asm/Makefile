.PHONY: clean all

all:	01

%:	%.asm
	nasm -f elf -g -F stabs $@.asm && ld -melf_i386 -s -o $@ $@.o && mv $@ bin/

clean:
	rm -f bin/*
