;; This file shows some code added to my emacs configuration to make
;; working in common lisp easier.

(require 'slime) ;; this is a REPL I use for lisp variants
;;; REPL (read evaluate print loop -- it makes these languages
;;; interactive)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode
                                               t)))

(require 'rainbow-delimiters-mode)
(rainbow-delimiters-mode) ;; colors parentheses depending on scope (so
;; awesome)


