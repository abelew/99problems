;; 13 Pack elements into sublists

;; I am not sure what they are asking with this:
;; Implement the so-called run-length encoding data compression 
;;    method directly. I.e. don't explicitly create the sublists 
;;    containing the duplicates, as in problem P09, but only count them.
;;    As in problem P11, simplify the result list by replacing the singleton 
;;    lists (1 X) by X.<br><br> 

;;     * (encode-direct '(a a a a b c c a a d e e e e))<br>
;;    ((4 A) B (2 C) (2 A) D (4 E))<p>


(defvar start '(a a a a b c c a a d e e e e))

;; I am learning that I get the concept of 'append backwards...

(defun encode-direct (lst)
  (let ((result '())
        (table (make-hash-table)))
    (loop
       for current in lst
       do (progn
            (format t "The current element is ~S ~%" current)
            (if (gethash current table)
                (setf (gethash current table) (incf (gethash current table)))
                (setf (gethash current table) 1))))

    (loop for key being the hash-keys of table
       using (hash-value value)
       do
         (progn
           (if (equal value 1)
               (setq result (append result (list key)))
               (setq result (append result (list (list key value))))
               ) ;; end if
           (format t "The result is ~S ~%" result)))
    ))

(progn
  (format t "~S" start)
  (format t "~%")
  (encode-direct start))

 
