;;; Ex 1.12: Write a proceedure to compute the elements of Pascal's
;;; triangle

(define (pascal-triangle n k)
  ;; Give the value of the nth row and kth column in Pascal's
  ;; triangle.
  (cond ((or (> k n) (< n 0)) #f)	; invalid 
	((or (= k 0) (= k n)) 1)	; edge of tringle
	(else (+ (pascal-triangle (- n 1) (- k 1))
		 (pascal-triangle (- n 1) k)))))
