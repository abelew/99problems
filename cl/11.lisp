;; 09 Pack elements into sublists

;; notes to self, I am using cmucl
;; (format uses ~S for any lisp object, ~D for any int, ~% is newlines)

;; This is modified run-length encoding which just includes an element when it isn't repeated.

;; (my-pack '(a a a a b c c a a d e e e e))
;; should evaulate to:
;; '((a a a a) b (c c) (a a) d (e e e e))


(defvar start '(a a a a b c c a a d e e e e))

;; I am learning that I get the concept of 'append backwards...

(defun modified_encode (lst &optional result)
  (when (null result) (setq result '()))
  (let ((current_element nil)
        (next_element nil)
        (next 1)
        (count 0)
        (element_count 0)
        (element_list '()))
    (loop
       for x in lst
       do (progn
            (setq current_element (nth count lst))
            (setq next_element (nth next lst))
            ;;(format t "loop start: ~S ~S ~S ~S ~%" current_element next_element count next)
            (incf count)
            (incf next)
            (if (equal current_element next_element)
                (incf element_count)
                (progn ;; else
                  (incf element_count)
                  (if (equal element_count 1)
                      (setq result (append result (list current_element)))
                      (setq result (append result (list (list element_count current_element)))))
                  (setq element_count 0)
                  (setq element_list '())
                  ))
            ))
    (format t "~a ~%" result)))

(progn
  (prin1 start)
  (format t "~%")
  (modified_encode start)
  )

 
