;; Problem 05
;; Figure out if a list is a palindrome



(defun main ()
  (setq original si::*command-args*)
  (format t "The list is ~S a palindrome.~%" (palindrome-p list))
  (force-output)
  (quit))


(defun palindrome-p (list)
  (setq half (/ (length list) 2.0))
  (if (integerp half) ;; then there were an even number of elements and we can split at nth
      (test-list (first-n half list) (first-n half (reverse list)))
      (test-list (first-n (- half 0.5) list) (first-n (- half 0.5) (reverse list)))
      ))

(defun first-n (num list &optional new)
  (when (null new) (setq new '()))
  (if (> num 0)
      (first-n (- num 1) (cdr list) (cons new (car list)))
      new
      ))

(defun test-list (first second)
  (if (eq first second)
      "is"
      "is not"
  ))

(setf system::*top-level-hook* #'main)
(system::save-system "tmpfile")
