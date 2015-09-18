;; Problem 02
;; Find the last but one box of a list
;; box is an odd term, looks like it is asking for the last two elements

(defun main ()
  (setq original si::*command-args*)
  (format t "The last 2 elements are: ~S ~S.~%" (penultimate original) (last_element original))
  (force-output)
  (quit))

(defun last_element (list)
  (car (reverse list)))

(defun penultimate (list)
  (cadr (reverse list)))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
