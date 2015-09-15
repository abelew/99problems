;; Problem 04
;; Reverse a list
;; common lisp also has a function for that, but again lets be more creative



(defun main ()
  (setq original si::*command-args*)
  (format t "The number of elements is: ~S.~%" (my-reverse original))
  (force-output)
  (quit))

(defun my-reverse (list &optional result)
  (when (null result) (setq result '()))
  (if (null list)
      result
    (my-reverse (cdr list) (cons (car list) result))))

;; a more 'normal' way of writing this would be something like:
(defun another-reverse (list &optional result)
  (when (null result) (setq result '()))
  ;; the thing to remember is that (if) only allows 1 statement each for the if/else side of the equation, therefore (progn) may be used to extend the life
  (if (null list)
      result
    (progn
      (setq result (cons (car list) result))
      (another-reverse (cdr list) result))))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
