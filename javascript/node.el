;; The following is what I added to emacs to use node.js

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

(setenv "NODE_NO_READLINE" "0")

;; the following allows me to run blocks in node.js by hitting Control-c Control-c
(eval-after-load "js-mode"
  '(progn
     (define-key js-mode-map (kbd "C-c C-c") 'js-send-last-sexp-and-go)))





