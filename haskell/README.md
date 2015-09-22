# Haskell

In order to play in haskell, I am currently using emacs'
haskell-mode.  I then do the following steps (so far):
1.  When I open a new .hs file, do meta-x haskell-interactive-mode.
2.  I do meta-x run-haskell to open a ghci session.
3.  In the .hs file I make a block named appropriately 'main'
4.  When ready, I type :l filename.hs in the ghci session.
5.  I run main inside the haskell session.

Theoretically C-c C-c (control-c control-c) should load my file
automagically in the running haskell process.  But I haven't gotten it
working properly yet, I dunno why.

I am putting a Makefile to compile these scripts, but it looks like
the only thing one needs to do to compile test.hs is:

```
ghc -o test test.hs
```

I am also adding haskell.el with the changes to my emacs configuration
to make sending data to a running haskell process easier.
