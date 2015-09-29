;; 20 Remove the K'th element from a list.

;;  * (remove-at '(a b c d) 2)
;;    (A C D)


(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun my-remove (lst num)
  "This function removes the nth element from a list.
It will remove the nth from the front for positive numbers
and nth from the back for negative numbers."
  (if (eq num 0) lst
      (if (< num 0)
          (my-remove-back lst num)
          (my-remove-front lst num))))


(defun my-remove-back (lst num &optional result)
  "Remove the nth element from a list counting from the right side."
  (if (null lst) result
      (if (eq num -1)
          (my-remove-back (reverse (cdr (reverse lst)))
                          (incf num)
                          result)
          (my-remove-back (reverse (cdr (reverse lst)))
                          (incf num)
                          (append (list (car (reverse lst))) result))
          )))

(defun my-remove-front (lst num &optional result)
  "Remove the nth element from a list counting from the left side."
  (if (null lst)
      result
      (progn
      (if (eq num 1)
          (my-remove-front (cdr lst) (decf num) result)
          (my-remove-front (cdr lst) (decf num) (append result (list (car lst))))
          ))))

(progn
  (format t "Start    : ~S ~%" start)
  (format t "Final    : ~S ~%" (my-remove start 4))
  (format t "Final rev: ~S ~%" (my-remove start -4))  
)
