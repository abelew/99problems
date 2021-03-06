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

;;(loop for x from 1 to 5
;;      for y = (* x 2)
;;      collect y)

(combination '(a b c d e f g h i j k l) 3)

(defun combination (lst num)
  (setq result '())
  (format t "Starting.")
  (loop for count from 0 to num do
       (if (eq count 0)
           (progn
             (let ((c 0))
               (loop for elem in lst do
                    (incf c)
                    (format t "c ~S elem ~S lst ~S result ~S ~%" c elem lst result)
                    (setq result (append result (list (list (my-remove c lst) (list elem))))))))
           (if (eq count num) ;; then we are finished
               result
               (progn ;; otherwise, continue
                 (setq result (expand-list result))))
           ))
  (setq finally '())
  (loop for almost in result do
       (format t "Almost ~S ~S ~%" almost (cadr almost))
       (setq finally (append finally (cdr almost))))
  (format t "The final answer is ~S ~%" finally)
  finally)

;; I want a function which takes
;; '( ((a b) (d e f)) ) and gives me
;; '(((b) (d e f a)) ((a) (d e f b))) ;; two elements
(defun expand-list (lst &optional result)
  (loop for element in lst
     do 
       (let ((yoink (car element))
             (receiver (cadr element))
             (counter 0))
;;         (format t "Looping with ~S with yoink: ~S receiver: ~S counter: ~S ~%" element yoink receiver counter)
         (loop for taken in yoink
            do 
              (setq counter (+ 1 counter))
;;              (format t "Inner loop now counter is: ~S taken is ~S ~%" counter taken)
              (setq result
                    (append result
                            (list (list
                                   (my-remove counter yoink)
                                   (append (list taken) receiver)))))
;;              (format t "Now result is ~S ~%" result)
              )))
  result)


(defun my-remove (num lst &optional result)
  "Remove the nth element from a list counting from the left side."
  (if (null lst)
      result
      (progn
        (if (eq num 1)
            (my-remove (decf num) (cdr lst) result)
            (my-remove (decf num) (cdr lst) (append result (list (car lst))))
          ))))
