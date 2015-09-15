;; Problem 01
;; Find the last element of a list

(defun main (args)
  (last_element (list 1 2 3))
  (format t "The last element was: ~A." (last_element args))
  (write-line "")
)

(defun last_element (list)
  (car (reverse list)))

