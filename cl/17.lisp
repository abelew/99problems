;; 17 Split a list into two parts; the length of the first
;;    part is given.

;; Do not use any predefined predicates.
;;    * (split '(a b c d e f g h i k) 3)
;;    ((A B C) (D E F G H I K))

(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun my-split (lst num &optional firsthalf)
  (if (null lst)
      result
      (progn
;;        (format t "Now state: ~S ~S ~S ~%" result counter num)
        (if (eq 1 num)
            (append (list (append firsthalf (list (car lst)))
                          (cdr lst)))
            (my-split (cdr lst) (decf num)
                      (append firsthalf (list (car lst))))
            ))))

(progn
  (format t "Start: ~S ~%" start)
  (format t "Final: ~S ~%" (my-split start 4))
)
