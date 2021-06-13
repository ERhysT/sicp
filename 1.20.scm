(define (gcd a b)
  ;; Greatest common divisor of integers a and b
  (if (= b 0) a (gcd b (remainder a b))))

;;; Applicative-order: evaluate then apply.
;;; Evaluates remainder 4 times (always occurs when evaluating alternative)
(gcd 206 40)
(gcd 40 6) 				; +1
(gcd 6 4)				; +2
(gcd 4 2)				; +3
(gcd 2 0)				; +4

(if (= b
       0)
    a
    (gcd b
	 (remainder a
		    b)))

;;; Normal order: fully expand then reduce
;;; remainder evaluated 1 + 2 + 4 + 7 + 4 = 18 times
(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))

;;; predicate =>(if (= 6 0) ...  + 1
(if (= (remainder 206 40) 0)		
    40
    (gcd (remainder 206 40)
	 (remainder 40 (remainder 206 40))))

;;; predicate =>(if (= 4 0 ) ... + 2 
(if (= (remainder 40 (remainder 206 40)) 
       0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
	 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;;; predicate =>(if (= 2 0)) ... + 4 
(if (= (remainder (remainder 206 40)
		  (remainder 40 (remainder 206 40)))
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
	 (remainder (remainder 40 (remainder 206 40))
		    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;;; predicate =>(if (= 0 0)) ...  + 7
(if (= (remainder (remainder 40 (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40 (remainder 206 40)))) 
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
    (gcd (remainder (remainder 40 (remainder 206 40))
		    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
	 (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
		    (remainder (remainder 40 (remainder 206 40))
		    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;;;; concequent + 4
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
2

