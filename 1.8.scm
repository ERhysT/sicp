;;; Newton's method for cube roots is based on the fact that if y is
;;; an approximation to the cube root of x, then a better
;;; approximation is given by the value
;;;
;;; ((x/y)+2y) / 3
;;;
;;; Use this formula to implement a cube-root procedure anlalogous to
;;; the square-root procedure.

(define (cuberoot-iter guess x)
  ;; Recurse until guess^2 is very close to x.
  (if (good-enough? guess x)
      guess
      (cuberoot-iter (improve guess x) x)))
(define (good-enough? guess x)
  ;; Has guess has converged to guess^3 ~= x?  
  (<= (abs (- (cube guess) x)) (* 0.0001 guess)))
(define (cube x)
  ;; x^3
  (* x x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (square x)
  ;; x^2
  (* x x))
(define (cuberoot x)
  (cuberoot-iter 1.0 x))

(cuberoot 8)
