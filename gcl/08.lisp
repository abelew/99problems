;; 08 Remove consecutive duplicates in a list
;; I am not sure how to pass a list of lists as command line args
;; so for the moment I will just do it as passed in 99_problems.html


(setq start '(a a a a b b b b b c c c c c))

;; I am learning that I get the concept of 'append backwards...

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

(defun my-compress2 (lst &optional result)
  (when (null result) (setq result '()))
  (when (null lst) result)
  (if (null (cddr lst))
      (if (equal (car lst) (cadr lst))
          (append result (list (car lst)))
          (append result (list (car lst) (cadr lst))))
      (progn
        (setq lst (cdr lst))
        (let ((first (car lst)) (second (cadr lst)))
          (if (equal first second)
              (my-compress2 lst result)
              (my-compress2 lst (append result (list first))))))))



;;(setq test (my-compress start))
(setq test (my-compress2 start))
test

  

  
  
