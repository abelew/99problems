# javascript

I am using nodejs and npm to play with javascript.
Emacs' mode js-comint provides a way to evaluate commands much like
one would do in haskell/lisp/etc.

The following snippet was added to my emacs configuration to do this:

```{elisp}
(require 'js-comint)
(setq inferior-js-program-command "nodejs --interactive")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))))
           ;;(replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))
```
