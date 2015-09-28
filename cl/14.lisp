;; 14 Duplicate the elements of a list

;;  (*) Duplicate the elements of a list.</strong>
;;    </dt><dd>Example:<br>
;;    * (dupli '(a b c c d))<br>
;;    (A A B B C C C C D D)<p>

(defvar start '(a a a a b c c a a d e e e e))

;; I am learning that I get the concept of 'append backwards...

(defun dupli (lst &optional result)
  (when (null result) (setq result '()))
  (if (null lst)
      result
      (progn
;;        (format t "~S ~%" result)
        (dupli (cdr lst) (append result (list (car lst) (car lst))))
        )))

(progn
  (format t "Start: ~S ~%" start)
  (format t "Final: ~S ~%" (dupli start))
)
