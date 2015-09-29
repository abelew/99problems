;; 19 Rotate a list N places to the left.

;;    * (rotate '(a b c d e f g h) 3)
;;     (D E F G H A B C)
;;    * (rotate '(a b c d e f g h) -2)
;;     (G H A B C D E F)


(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun my-rotate (lst num)
  (if (eq num 0) lst
      (if (< num 0)
          (back-to-front lst num)
          (front-to-back lst num))))


(defun back-to-front (lst num)
  (if (eq num 0) lst
      (back-to-front (reverse
                      (append
                       (cdr (reverse lst))
                       (list (car (reverse lst))))) (incf num))
      ))

(defun front-to-back (lst num)
  (if (eq num 0) lst
      (front-to-back (append (cdr lst) (list (car lst))) (decf num))
      ))

(progn
  (format t "Start    : ~S ~%" start)
  (format t "Final    : ~S ~%" (my-rotate start 4))
  (format t "Final rev: ~S ~%" (my-rotate start -4))  
)
