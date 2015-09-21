;; 12 Reverse #11

;; (unpack '((4 a) b (2 c) (2 a) (4 e)))
;; should evaluate back to '(a a a a b c c a a d e e e e)

(defvar start '((4 a) b (2 c) (2 a) (4 e)))

(defun my-unpack (lst &optional result)
  (when (null result) (setq result '()))
  (if (null lst)
      result
      (progn
        (if (listp (car lst))
            (my-unpack (cdr lst) (append result (my-expand (car (car lst)) (cadr (car lst)))))
            (my-unpack (cdr lst) (append result (list (car lst))))
            ))))

(defun my-expand (num element &optional result)
  (if (equal num 0)
      result
      (my-expand (decf num) element (append result (list element)))))
    

(progn
  (prin1 start)
  (format t "~%")
  (format t "The answer: ~S ~%" (my-unpack start))
  )

 
