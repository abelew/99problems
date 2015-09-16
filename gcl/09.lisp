;; 09 Pack elements into sublists

;; (my-pack '(a a a a b c c a a d e e e e))
;; should evaulate to:
;; '((a a a a) (b) (c c) (a a) (d) (e e e e))


(defvar start '(a a a a b c c a a d e e e e))

;; I am learning that I get the concept of 'append backwards...

(defun my-pack (lst &optional result)
  (when (null result) (setq result '()))
  (let ((current_element nil)
        (next_element nil)
        (next 1)
        (count 0)
        (tmplist '()))
    (loop
       for x in lst
       do (progn
            (setq current_element (nth count lst))
            (setq next_element (nth next lst))
            (incf count)
            (incf next)
            (setq tmplist '())
            (format t "~a ~a" current_element next)
         ))))
;;         (setq current_element (nth count lst))
;;         (setq next_element (nth next lst))
;;         (if (equal current_element next_element)
;;             (append qtmplist (list current_element next_element))
;;             (progn (append result (list tmplist))
;;                    (setq tmplist (list next_element)))))))



;;(setq test (my-compress start))
(setq test (my-pack start))
test

  

  
  
