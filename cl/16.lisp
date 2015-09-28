;; 16 Drop every N'th element from a list.

;;    * (drop '(a b c d e f g h i k) 3)
;;    (A B D E G H K)


(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

;; I am learning that I get the concept of 'append backwards...

(defun my-drop (lst num &optional result counter)
  (when (null counter) (setq counter num))
  (if (null lst)
      result
      (progn
;;        (format t "Now state: ~S ~S ~S ~%" result counter num)
        (if (eq 1 counter)
          (my-drop (cdr lst) num result num)
          (my-drop (cdr lst) num (append result (list (car lst))) (decf counter))
          ))))

(progn
  (format t "Start: ~S ~%" start)
  (format t "Final: ~S ~%" (my-drop start 2))
)
