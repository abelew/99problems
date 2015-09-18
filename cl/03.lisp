;; Problem 03
;; Find the nth element of a list
;; note though that lisp has a function nth which does exactly that, so lets be more creative...
;; For this, lets have the first argument be the nth of nth element

(defun main ()
  (setq original si::*command-args*)
  (setq nth (car original))
  (setq original (cdr original))
  (format t "The ~S element is: ~S.~%" (my-nth nth original))
  (force-output)
  (quit))

(defun my-nth (num list)
  (if (> num 1)
      (my-nth (- num 1) (cdr list))
      (car list)
      ))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
