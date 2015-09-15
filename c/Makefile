.PHONY: clean all

all:	01

%:	%.c
	gcc `pkg-config --cflags --libs glib-2.0` -o $@ $@.c && mv $@ bin/$@

clean:
	rm -f bin/*
