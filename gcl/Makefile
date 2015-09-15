.PHONY: clean all

all:	01 02

%:	%.lisp
	gcl -load $@.lisp && mv tmpfile bin/$@

clean:
	rm -f bin/*
