;; 26   (**) Generate the combinations of K distinct objects
;;      chosen from the N elements of a list</strong>

;;    In how many ways can a committee of 3 be chosen from a group of 
;;    12 people? We all know that there are C(12,3) = 220 possibilities 
;;    (C(N,K) denotes the well-known binomial coefficients). For pure
;;    mathematicians, this result may be great. But <i>we</i> want to
;;    really generate all the possibilities in a list.<br><br> 

;;    * (combination 3 '(a b c d e f))
;;    ((A B C) (A B D) (A B E) ... )

;; holy crap this marks an increase in difficulty
;; but it really isn't that hard, just think a moment
;; recurse until num is 0
;; result starts as '()
;; On the 0th iteration make '( (a b c d) ())
;; On the first iteration, step through every element of lst and make:
;; '( ((b c d) (a)) ((a c d) (b)) ((a b c) (d)) )
;; The car is what I have left to choose from, the cdr is my current list.
;; Recurse again and for every element of every car of result
;;   grab a new element and append it to the cdr list
;; Thus iteration 2 leaves us:
;; '( ((c d) (a b)) ((b d) (a c)) ((b c) (a d)) ((c d) (b a)) ((a d) (b c)) ((a c) (b d)) ((b c) (d a)) ((a c) (d b)) ((a b) (d c)) )
;; Doing it this way assumes that each position of the 'committee' is unique
;; This probably is not the intent of the problem, but it might be

;; In any event, once I have done that I can recurse through the list, pull every cdr
;; and that is the answer (with the preceeding assumption).

;; 1.  Using every element of result, append to them every remaining element
;; remove every character in the list
(defun combination (&key (lst '(a b c d)) (num 2) (result '()))
  (when (null result) (setq result (append (list lst) (list result))))
  (if (eq num 0)
      (pull-cdrs result)
      (combination lst (decf num) (my-expand result))
      ))

(defun my-expand (lst &optional result)
  (if (null (cdr lst))
      result
      (my-expand (cdr lst) (append result (list (extract-all (caar lst) (cdr (car lst))))))
      ))

(defun my-extract-all (yoink onto &optional result num)
  (when (null num) (setq num 1))
  (if (null yoink)
      result
      (my-extract-all (cdr yoink)
                      onto
                      (append result (list (my-remove num yoink) (list (cons (car yoink) onto))))
                      (+ num 1))
      ))

(defun pull-cdrs (lst)
  lst)

(defun my-remove (element lst)
  "Remove the nth element from a list counting from the left side."
  (if (null lst)
      result
      (progn
        (if (eq num 1)
            (my-remove (cdr lst) (decf num) result)
            (my-remove (cdr lst) (decf num) (append result (list (car lst))))
          ))))
