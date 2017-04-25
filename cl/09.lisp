;; 09 Pack elements into sublists

;; notes to self, I am using cmucl
;; (format uses ~S for any lisp object, ~D for any int, ~% is newlines)

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
            ;;(format t "loop start: ~S ~S ~S ~S ~%" current_element next_element count next)
            (incf count)
            (incf next)
            (setq tmplist (append tmplist (list current_element)))
            (if (not (equal current_element next_element))
                (progn ;; else
                  ;;(format t "Starting nonequal clause ~S ~%" tmplist)
                  (setq result (append result (list tmplist)))
                  (setq tmplist '())
                  ))
            ))
    (format t "~a ~%" result)))

(progn
  (prin1 start)
  (format t "~%")
  (my-pack start))
