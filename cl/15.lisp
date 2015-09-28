;; 14 Duplicate the elements of a list

;;  (**) Replicate the elements of a list a given number of times.
;;    * (repli '(a b c) 3)
;;    (A A A B B B C C C)

(setq start '(a b c c aa de e))

;; I am learning that I get the concept of 'append backwards...

(defun my-repli (lst num &optional result)
  (if (null lst)
      result
      (my-repli (cdr lst)
                num
                (append result (my-rep (car lst) num)))
        ))

(defun my-rep (element num &optional res)
  (if (eq num 0)
      res
      (my-rep element (decf num) (append res (list element)))))

(progn
  (format t "Start: ~S ~%" start)
  (format t "Final: ~S ~%" (my-repli start 3))
)
