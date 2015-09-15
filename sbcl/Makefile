.PHONY: clean all

all:	01

clean:
	rm -f bin/*

%:	%.lisp
	buildapp --output $@ --load $@.lisp --entry main && mv $@ bin/


## sbcl can do this:
###!/usr/bin/sbcl --script
##(write-line "Hello, World!")
