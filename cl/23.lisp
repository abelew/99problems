;; 23 Make a list from n random elements of the list

;;  (**) Extract a given number of randomly selected elements from a 
;;  list.
;;  The selected items shall be returned in a list.

;;    * (rnd-select '(a b c d e f g h) 3)
;;    (E D A)

(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun my-rnd-selectv1 (lst num &optional result)
  "This makes a list out of random elements from that list for num elements.
I realized after writing it that the goal is to remove the num elements from
the original list and create the new list from those.  I will do that next,
though since we have my-remove, it doesn't seem very exciting..."
  (let ((new (nth (random (length lst)) lst)))
    (if (eq num 0)
        result
        (my-rnd-selectv1 lst (decf num) (append result (list new))))
    ))

(defun my-rnd-selectv2 (lst num &optional result old-list) 
  "This makes a list out of random elements from an existing list for up to num elements.
Thus it is a shuffler."
  (when (null old-list) (setq old-list lst))
  (setf selected-num (+ (random (length lst)) 1))
;;  (format t "Selected number: ~S ~%" selected-num)
  (setf new-element (nth (- selected-num 1) lst))
;;  (format t "Selected element: ~S ~%" new-element)
  (setf new-list (my-remove old-list selected-num))
;;  (format t "New list: ~S ~%" new-list)
;;  (format t "Old list: ~S ~%" old-list)
  (setf result (append result (list new-element)))
  
  (if (eq num 1)
      result
      ;;      (my-rnd-selectv2 new-list (decf num) result old-list)
      (my-rnd-selectv2 new-list (decf num) result new-list)      
      ))


(defun my-remove (lst num &optional result)
  "Remove the nth element from a list counting from the left side."
  (if (null lst)
      result
      (progn
      (if (eq num 1)
          (my-remove (cdr lst) (decf num) result)
          (my-remove (cdr lst) (decf num) (append result (list (car lst))))
          ))))



(progn
  (format t "Start  : ~S ~%" start)
  (format t "Finalv1: ~S ~%" (my-rnd-selectv1 start 9))
  (format t "Finalv2: ~S ~%" (my-rnd-selectv2 start 9))
  )
