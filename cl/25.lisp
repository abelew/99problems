;; 25 Generate a random permutation of the elements of a list.</strong>


;;   * (rnd-permu '(a b c d e f))<br>
;;   (B A D C E F)<br><br>

;; My question, what is to stop me from just using the lotto and setting the number of elements
;; to the length of the list?

(defun rnd-permu (lst)
  (my-rnd-selectv3 lst (length lst)))

(defun my-rnd-selectv3 (lst num &optional result)
  "This makes a list out of random elements from an existing list for up to num elements.
Thus it is a shuffler."
  (let* ((selected-num (+ (random (length lst)) 1))
         (new-element (nth (- selected-num 1) lst))
         (new-list (my-remove lst selected-num))
         (result (append result (list new-element))))
    (if (eq num 1)
        result
        ;;      (my-rnd-selectv2 new-list (decf num) result old-list)
        (my-rnd-selectv3 new-list (decf num) result)
        )))

(defun my-remove (lst num &optional result)
  "Remove the nth element from a list counting from the left side."
  (if (null lst)
      result
      (progn
      (if (eq num 1)
          (my-remove (cdr lst) (decf num) result)
          (my-remove (cdr lst) (decf num) (append result (list (car lst))))
          ))))
