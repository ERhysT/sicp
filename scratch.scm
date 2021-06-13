(define (iter n product counter)
  (if (> counter n)
      product
      (iter n (* product counter) (+ counter 1))))
(define (factorial n)
  (iter n 1 1))

;; This can be expanded to a fixed rule that is run n times.
(factorial 5)
(iter 5 1 1)
(iter 5 (* 1 1) (+ 1 1))
(iter 5 1 2)
(iter 5 (* 1 2) (+ 2 1))
(iter 5 2 3)
(iter 5 (* 2 3) (+ 3 1))
(iter 5 6 4)
(iter 5 (* 6 4) (+ 4 1))
(iter 5 24 5)
(iter 5 (* 24 5) (+ 5 1))
120

(= (factorial 5) 120)

;; it can also be writen with iter declared local to factorial

(define (factorial n)
  (define (iter product count)
    (if (> count n)
	product
	(iter (* product count) (+ count 1))))
  (iter 1 1))
