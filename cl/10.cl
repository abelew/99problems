#!/usr/bin/cl --lisp 'sbcl' -E main -X

;; 09 Pack elements into sublists

;; notes to self, I am using cmucl
;; (format uses ~S for any lisp object, ~D for any int, ~% is newlines)

;; (my-pack '(a a a a b c c a a d e e e e))
;; should evaulate to:
;; '((a a a a) (b) (c c) (a a) (d) (e e e e))

;; The material cl:defpackage ... :script allows one to compile this into
;; an executable with cl-launch using sbcl.


(defvar start '(a a a a b c c a a d e e e e))

(defun main (sb-ext:*posix-argv*)
  (progn
    (format t "~a ~%" start)
    (format t "~%")
    (my-listcount start))
  )

;; I am learning that I get the concept of 'append backwards...
(defun my-listcount (lst &optional result)
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
                 (setq result (append result (list (list element_count current_element))))
                 (setq element_count 0)
                 (setq element_list '())
                 ))
           ))
    (format t "~a ~%" result)))


