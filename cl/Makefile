.PHONY: clean all

all:	01

%:	%.lisp
		cl-launch --lisp sbcl --file $@.lisp --dump '!' --output $@ -i '(script:run)'

clean:
	rm -f bin/*
