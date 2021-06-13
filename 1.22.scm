(define runtime get-internal-run-time)
(define (square x) (* x x))

(define (smallest-divisor n)
  ;; Smallest divisor of n.
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  ;; Smallest divisor of n starting at test-divisor. 
  (define (divides? a b) 
    ;; #t only when the quotient of b and a is an integer.
    (= (remainder b a) 0))
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (prime? n)
  ;; #t only if n is a prime number.
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  ;; Prints n and primality test results to stdout. #t only when n is
  ;; prime.
  (define (start-prime-test n start-time)
    (define (report-prime n elapsed-time)
      (display n)
      (display " *** ")
      (display elapsed-time)
      (newline)
      #t)
    (if (prime? n)
	(report-prime n (- (runtime) start-time))
	#f))
  (start-prime-test n (runtime)))
(define (search-for-n-primes-between start end n)
  ;; Prints at most n prime numbers between start and end
  (define (iter next total)
    (if (and (< next end) (< total n))
	(if (timed-prime-test next)
	    (iter (+ next 1) (+ total 1))
	    (iter (+ next 1) total))))
  (iter start 0))
(define (search-for-primes-between start end)
  ;; Prints all prime numbers between start and end
  (search-for-n-primes-between start end (- end start)))

(search-for-n-primes-between 1000000000000 10000000000000 3)
;;; 1000000000039 *** 97775272
;;; 1000000000061 *** 97913859
;;; 1000000000063 *** 97938993
(search-for-n-primes-between 10000000000000 100000000000000 3)
;;; 10000000000037 *** 314497654
;;; 10000000000051 *** 306319210
;;; 10000000000099 *** 306633156
(search-for-n-primes-between 100000000000000 1000000000000000 3)
;;; 100000000000031 *** 990544516
;;; 100000000000067 *** 971050788
;;; 100000000000097 *** 969620412
scheme@(guile-user)> (search-for-n-primes-between 1000000000000000 10000000000000000 3)
;;;
;;; The number of steps required for the operations is proportioal to
;;; the time taken to compute. For every 10x increase in n, t
;;; increases by a factor of ~3. Noting that sqrt(10) ~ 3 therefore
;;; O(sqrt(n)) seems a appropriate predicton.
