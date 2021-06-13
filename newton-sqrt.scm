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
  ;; 
  (sqrt-iter 1.0 x))

