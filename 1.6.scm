;;; Alyssa P.  Hacker doesn't see why if needs to be provided as a
;;; special form. "Why can't I just define it as an ordinary procedure
;;; in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims
;;; this cam indeed be done, and she defines a new version of if.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;;; Eva demonstrates the program for Alyssa
(new-if (= 2 3) 0 5)			; => 5
(new-if (= 1 1) 0 5)			; => 0

;;; Delighted, Alyssa uses new-if to rewirte the square-root program:
(load "newton-sqrt.scm")
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

;; 'if' is a special form and only evaluates one of the consequent or
;; alternative - dependent on the value from evaluatiing the predicate
;; expression. 'new-if' is not a special form so all subexpressions
;; are evaluated applicative order. Consequently the recursion within
;; the body of the proceedure sqrt-iter is evaluated forever
;; regardless of the result of evaluation of the predicate.




