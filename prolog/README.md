# Prolog

I am playing with SWI prolog.
It is both an interpreter and compiler as far as I understand.
One may evaluate code via the emacs REPL and/or write it as a script.

I have so far chosen to write these as prolog scripts which may be executed from the command line.

If one ends main with halt., then the interpreter will immediately die.
As a result, I am ending my main with fail. which will cause a warning, but still run everything.
