;; I am using emacs' haskell-mode and meta-x run-haskell
;; in order to send material to a running ghc session.

;; A google search for 'modern emacs haskell mode'
;; provides the set of things I am using
;; Packages were installed via 'el-get-install haskell-mode hi2 flycheck'

;; the following are changes I made to my emacs initialization to make
;; it work.
;; It is not yet clear to me what the differences are between using run-haskell and haskell-inferior and why one gives me the lambda> prompt while the other gives me a Prelude> prompt.

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "C-c C-n") 'haskell-send-line)
     (define-key haskell-mode-map (kbd "C-c C-n") 'inferior-haskell-send-paragraph)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

;; Then when editing my .hs file, I hit control-c control-l to load the file into an interactive haskell process.
;; From the lambda> prompt I can also do :l 01.hs to compile/load 01.hs

(defun get-haskell-proc ()
  "Since the haskell process isn't listed with a buffer like other REPL processes, I cheese it out by iterating over process-list"
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

(defun haskell-send-region ()
  "Send an arbitrary region to an existing haskell process."
  (interactive "*")
  (save-excursion
    (setq region-string (buffer-substring (region-beginning) (region-end)))
    (haskell-eval region-string)
      ))

(defun haskell-send-line ()
  "Send the current line to a running haskell process."
  (interactive "*")
  (save-excursion
    (end-of-line)
    (set-mark (line-beginning-position))
    (setq region-string (buffer-substring (region-beginning) (region-end)))
    (haskell-eval region-string)
    ))

(defun haskell-send-paragraph ()
  (interactive "*")
  (save-excursion
    (forward-paragraph)
    (setq region-end (point))
    (backward-paragraph)
    (setq region-start (point))
    (setq region-string (buffer-substring region-start region-end))
    (haskell-eval region-string))
    )
    
(defun haskell-eval (string)
  "Evaluate an arbitrary string in an existing process in the buffer named '*haskell*'")
  (interactive "*")
  (save-excursion
    (setq buffer-name "*haskell*")
    (setq haskell-proc (get-haskell-proc))
    (setq haskell-buffer (get-buffer buffer-name))
    (set-process-buffer haskell-proc haskell-buffer)
    (setq final-string (format "%s\n" string))
    ;; comint-send-string and process-send-string should be equivalen in this context, but process-send string is simpler?
    ;;(comint-send-string haskell-proc final-string)))
    (process-send-string haskell-proc final-string)))


;; I toyed with using this to send the current file to the haskell process by sending to the haskell buffer
;; the string ':l <filename>, I might yet.
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
