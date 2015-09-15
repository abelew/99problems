;; 08 Remove consecutive duplicates in a list
;; I am not sure how to pass a list of lists as command line args
;; so for the moment I will just do it as passed in 99_problems.html


(setq start '(a a a a b b b b b c c c c c))

;; this is still broken

(defun my-compress (lst &optional result)
  (when (null result) (setq result '()))
  (cond ((null (cddr list))
         (if (equal (car lst) (cadr lst))
             result
             (append (list (car lst) (cadr lst)) result)))
        ((equal (car lst) (cadr lst))
         (my-compress (cdr lst) result))
        (t (my-compress (cdr lst) (append result (list (car lst)))))
        ))
             
(setq test (my-compress start))
test

  

  
  
