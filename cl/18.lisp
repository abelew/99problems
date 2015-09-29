;; 18 Extract a slice from a list.

;; Given two indices, I and K, the slice is the list
;; containing the elements between the I'th and K'th element
;; of the original list (both limits included). Start counting
;; the elements with 1.

;; * (slice '(a b c d e f g h i k) 3 7)
;;   (C D E F G)

(setq start '(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20))

(defun my-slice (lst start end &optional result)
  (if (< end 1)
      result
      (if (<= start 1)
          (my-slice (cdr lst) (decf start) (decf end) (append result (list (car lst))))
          (my-slice (cdr lst) (decf start) (decf end) result))))


(progn
  (format t "Start: ~S ~%" start)
  (format t "Final: ~S ~%" (my-slice start 4 12))
)
