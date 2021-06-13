(define (halve n) (/ n 2))
(define (double n) (+ n n))
(define (multiply a b)
  (iter a b 0))
(define (iter a b n)
  (cond ((= b 0) n)
	((even? (iter a (halve b) (+ n (double a)))))
	(else (iter a (- b 1) (+ n a)))))

(multiply 0 2)

