;;; If n is a prime number and 'a' is any positive integer less than
;;; n, then 'a' raised to the nth power is conguruent to a modulo n.
(define (expmod base exp m)
  ;; Exponential of a number modulo another number
  (define (square n) (* n n))
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (fprime? n) (fast-prime? n 10000))

(fprime? 6601)
