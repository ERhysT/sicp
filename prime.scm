(define (square n)
  ;; n raised to the power of 2
  (* n n))

(define (smallest-divisor n)
  ;; Smallest divisor of n
  (find-divisor n 2))			
(define (find-divisor n test-divisor)
  ;; n's next divisor starting at test-divisor
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  ;; Tests if a divides by b
  (= (remainder b a) 0))
(define (prime? n)
  ;; Test if n is a prime number
  (= n (smallest-divisor n)))

(prime? 3)

