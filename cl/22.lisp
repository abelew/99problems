;; 22 Create a list of a range of numbers

;; If first argument is smaller than second, produce a list in
;; decreasing order.

;; * (range 4 9)<br>
;; (4 5 6 7 8 9)<p>

(defun my-range (start end &optional result)
  "Make a list of a range of numbers."
  (if (eq start end) (append result (list start))
      (if (> start end)
          (my-range (- start 1) end (append result (list start)))
          (my-range (+ start 1) end (append result (list start)))
          )))

(progn
  (let ((start 4) (end 12))
  (format t "Making a range from ~S to ~S ~%" start end)
  (format t "Final1: ~S ~%" (my-range start end))
  (format t "Final (12 to 4):  ~S ~%" (my-range 12 4))
  (format t "Final (-12 to 4): ~S ~%" (my-range -12 4))
  ))

