;; 24 Lotto: Draw N different random numbers from the set 1..M.

;; The selected numbers shall be returned in a list.

;;    * (lotto-select 6 49)<br>
;;    (23 1 17 33 21 37)<br><br>

;; I am going to used named parameters here, because I can


;;(my-lotto) ;; assumes 1-10, 10 elements
;;(my-lotto :start 10 :end 100 :num 20)"


(defun my-lotto (&key (start 1) (end 10) (num 10))
  "Pull num random numbers from start to end, it isn't specified if they
 should be repeated or not, I will assume not.  This is using a common lisp
 &key, so call it like this: my-lotto :start 10 :end 100 :num or my-lotto --
 weird emacs indentation fails if I add the parens inside these docstrings,
 good to know I guess."
  (let ((range (my-range start end)))
    (if (> num (length range))
        (progn
          (warn "I can only take up to '(- end start) elements, setting num to the length of the list.")
          (setq num (length range))))
    (my-rnd-selectv3 range num)))

(defun my-range (start end &optional result)
  "Make a list of a range of numbers."
  (if (eq start end) (append result (list start))
      (if (> start end)
          (my-range (- start 1) end (append result (list start)))
          (my-range (+ start 1) end (append result (list start)))
          )))

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
