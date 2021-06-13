(define (multiply a b)
  ;; ab =  { 0          if b = 0,
  ;;       { 2a*b/2     if b is even, 
  ;;       { a + a(b-1) otherwise.
  (define (halve n) (/ n 2))
  (define (double n) (+ n n))
  (define (iter accumulator a b)
    (cond ((= b 0) accumulator)
	  ((even? b) (iter accumulator
			   (double a)
			   (halve b)))
	  (else (iter (+ accumulator a)
		      a
		      (- b 1)))))
  (iter 0 a b))

(multiply 1 1)
(multiply 10 7)
(multiply 10 10)




