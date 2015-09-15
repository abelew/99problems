;; Problem 03
;; Find the number of elements in a list
;; common lisp also has a function for that, but again lets be more creative
;; since I did an traditional recursive in the last, do tail recursion this time...


(defun main ()
  (setq original si::*command-args*)
  (format t "The number of elements is: ~S.~%" (my-count original))
  (force-output)
  (quit))

(defun my-count (list &optional count)
  (when (null count) (setq count 1))
  (if (null (cdr list))
      count
      (my-count (cdr list) (+ count 1))))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
