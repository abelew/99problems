;; 21 Insert an element at a given position into a list.

;;    * (insert-at 'alfa '(a b c d) 2)<br>
;;    (A ALFA B C D)<p>

(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun insert-at1 (element lst num &optional result)
  "This function inserts element into lst at position num."
  (if (null lst)
      result
      (if (eq num 1)
          (insert-at element (cdr lst) (decf num) (append result (list element (car lst))))
          (insert-at element (cdr lst) (decf num) (append result (list (car lst))))
          )))

(defun insert-at2 (element lst num &optional slice)
  "The previous insert-at needs to recurse through the whole list, this one shouldn't."
  (if (eq num 1)
      (append slice (list element (car lst)) (cdr lst))
      (insert-at2 element (cdr lst) (decf num) (append slice (list (car lst))))
      ))

(defun insert-at3 (element lst num)
  "Here is another way to do it using lisp's list-slicing (subseq lst start end)"
  (append (subseq lst 0 (decf num))
          (list element)
          (subseq lst num (length lst))))

(progn
  (format t "Start    : ~S ~%" start)
  (format t "Final    : ~S ~%" (insert-at1 'atatat start 4))
  (format t "Finalv2  : ~S ~%" (insert-at2 'atatat start 4))
  (format t "Finalv3  : ~S ~%" (insert-at3 'atatat start 4))    
  )
