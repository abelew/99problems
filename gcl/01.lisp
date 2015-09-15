;; Problem 01
;; Find the last element of a list

(defun main ()
  (format t "The last element was: ~S.~%" (last_element si::*command-args*))
  (force-output)
  (quit))

(defun last_element (list)
  (car (reverse list)))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
