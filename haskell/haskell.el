;; I am using emacs' haskell-mode and meta-x run-haskell
;; in order to send material to a running ghc session.

;; A google search for 'modern emacs haskell mode'
;; provides the set of things I am using
;; Packages were installed via 'el-get-install haskell-mode hi2 flycheck'

;; the following are changes I made to my emacs initialization to make
;; it work.
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

;; Then when editing my .hs file, I hit control-c control-l to load the file into an interactive haskell process.

;; From the lambda> prompt I can also do :l 01.hs to compile/load 01.hs
