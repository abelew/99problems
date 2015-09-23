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
     (define-key haskell-mode-map (kbd "C-c C-n") 'haskell-send-line)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

;; Then when editing my .hs file, I hit control-c control-l to load the file into an interactive haskell process.

;; From the lambda> prompt I can also do :l 01.hs to compile/load 01.hs

(defun get-haskell-proc ()
  (interactive)
  (require 'cl)
  (setq lst (process-list))
  (setq answer nil)
  (loop
   for x in lst
   do
   (progn
     (if (equal (process-name x) "haskell")
         (setq answer x)))
   )
  answer)



(defun haskell-send-line ()
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position))
  (setq buffer-name "*haskell*")  
  (setq region-string (buffer-substring (region-beginning) (region-end)))
  (setq string (format "%s\n" region-string))
  (setq proc (get-haskell-proc))
  (set-process-buffer proc buffer)
  (comint-send-string proc string)
  )


(defun append-string-to-buffer (buffer string)
  ;; Modified from append-to-buffer, defined in the emacs-lisp intro
  "Append to specified buffer the specified text.
It is inserted into that buffer at end of buffer.

When calling from a program, give two arguments:
BUFFER (or buffer name), and the STRING to be copied."
  (interactive
   (list (read-buffer "Append to buffer: " (other-buffer
                                            (current-buffer) t))
         (read-string "String to append: ")))

  (let* ((append-to (get-buffer-create buffer))
         (windows (get-buffer-window-list append-to t t))
         move-point-in-windows)
    (with-current-buffer append-to
      (barf-if-buffer-read-only)
      ;; record in which windows we should keep point at eob.
      (dolist (window windows)
        (when (= (window-point window) (point-max))
          (push window move-point-in-windows)))
      (let (return-to-position)
        ;; decide whether we should reset point to return-to-position
        ;; or leave it at eob.
        (unless (= (point) (point-max))
          (setq return-to-position (point))
          (goto-char (point-max)))
        (insert string)
        (when return-to-position
          (goto-char return-to-position)))
      ;; advance to point-max in windows where it is needed
      (dolist (window move-point-in-windows)
        (set-window-point window (point-max))))))
