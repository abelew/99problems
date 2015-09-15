;; 07 flatten a list
;; I am not sure how to pass a list of lists as command line args
;; so for the moment I will just do it as passed in 99_problems.html

(setq start '(a (b (c d e) e d) (f d) g))

(defun my-flatten (list &optional result)
  (when (null result) (setq result '()))
  (let ((element (car list)))
    (cond ((null list)
           result)
          ((listp element)
           (my-flatten
            (append (list (car element)) (append (cdr element) (cdr list)))
            result))
          (t (my-flatten (cdr list) (append result (list element))))
          )))

(setq test (my-flatten start))
(print test)


  

  
  
