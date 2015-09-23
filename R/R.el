;; I use ESS for playing in R along with rmarkdown and poly-mode.
;; The following provides my working environment in emacs.

;; The installation was just:
;; meta-x el-get-install ess
;; meta-x el-get-install polymode

(require 'ess-site)
(require 'poly-R)
(require 'markdown-mode)
(require 'poly-markdown)


(setq
 ess-use-auto-complete nil
 auto-mode-alist (append '(("\\.rmd$" . poly-markdown+r-mode)) auto-mode-alist)
 ;; other variables here
 )

(eval-after-load "ess-site"
  '(progn
     (define-key ess-mode-map (kbd "C-c C-n") 'ess-eval-line-and-step)
     ))

;; I am probably the worst writer of R on the planet,
;; I pretty much refuse to use <- when an = works perfectly well.
;; In order to not be too much of an arsehole, I do at least do the following:
;; variable = function(param=value)
;; variable = value
;; thus variables and their values are set with <- by normal people
;; but I do 'v = v', and when setting parameters I do 'v=v' to make
;; the difference visible.
;; as a result ess-toggle-underscore is obnoxious to me.
(ess-toggle-underscore nil)
