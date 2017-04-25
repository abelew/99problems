;; Problem 01
;; Find the last element of a list

;; Note to self: to use documentation strings try the following:
;; (describe 'last_element)
;; (documentation 'last_element 'function)

;; this was written so that only gcl will work.
(defun main ()
  (format t "The last element was: ~S.~%" (last_element si::*command-args*))
  (force-output)
  (quit))

(defun last_element (list)
  "Get the last element of a list."
  (car (reverse list)))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
