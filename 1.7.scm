;;; The good-enough? test used in computing square roots will not be
;;; very effective for finding the sqare roots of very small
;;; numbers. Also in real computers, arithmetic operations are almost
;;; always performed with limited precision. This makes our test
;;; inadequate for very large numbers.
;;;
;;; Explain these statements, with examples showing how the test fails
;;; for small and large numbers. An alternative strategy for
;;; implementing good-enough? is to watch how guess changes from one
;;; iteration to the next and to stop when the change is a very small
;;; fraction of the guess. Design a square-root proceedure that uses
;;; this kind of end test. Does this work better for small and large
;;; numbers.

(define (sqrt-iter guess x)
  ;; Recurse until guess converges to estimate of sqrt x  
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  ;; Has guess has converged to guess^2 ~= x?  
  (< (abs (- (square guess) x)) 0.001))
(define (square x)
  ;; x^2
  (* x x))
(define (improve guess x)
  ;; Make another step towards convergence 
  (average guess (/ x guess)))
(define (average x y)
  ;; Numerical mean of x and y
  (/ (+ x y) 2))
(define (sqrt x)
  ;; Calculate x^(1/2)
  (sqrt-iter 1.0 x))

;;; The good-enough? test is not an adequate test for very small
;;; numbers at small numbers as the convergence critera becomes
;;; significant relative to the square root estimate. For very large
;;; numbers, the convergence criteria becomes less than the precision
;;; capability of the number as represented in memory.
(sqrt 0.0001)				; => 0.03230844833048122
(sqrt 250000000.0001)			; => 15811.388300845185

(define (good-enough? guess x)
  ;; A rewrite of good-enough? which watches how guess changes from
  ;; one iteration to the next and returns #f when the change is a
  ;; very small fraction of the guess.
  (<= (abs (- (square guess) x)) (* guess 0.001)))

(sqrt 0.0001)				; => 0.010120218365353947
(sqrt 250000000.0001)			; => 15811.388300845185




