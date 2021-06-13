(define (smallest-divisor n)
  ;; smallest divisor of n
  (define (iter q)
    ;; increment quotient until no remainder
    (cond ((> (/ n 2) q) n)
	  ((= 0 (remainder n q)) q)
	  (else (iter (+ q 1)))))
  (iter 2))

(smallest-divisor 199)			; => 199
(smallest-divisor 1999)			; => 1999
(smallest-divisor 19999)		; => 7

