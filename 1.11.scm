;;; A function f is defined by the rule that
;;;
;;; f(n) = { n                            if n <  3,
;;;        { f(n-1) + 2f(n-2) + 3f(n-3)   if n >= 3.
;;;

;;; f(1) = 1
;;; f(2) = 2 
;;; f(3) = 3
;;; f(4) = (4-1) + 2(4-2) + 3(4-3)
;;; f(5) = (5-1) + 2(5-2) + 3(5-3) 

(define (reference-solution n) 
  ;; A confirmed solution (iterative) for checking my answers.
  (define (f-i a b c count) 
    (cond ((< n 3) n) 
          ((<= count 0) a) 
          (else (f-i (+ a (* 2 b) (* 3 c)) a b (- count 1))))) 
  (f-i 2 1 0 (- n 2)))

(reference-solution 10)

(define (f n)
  (define (iter a b c count)
    (cond ((< n 3) n)
	  ((<= count 0) a)
	  (else (iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (iter 2 1 0 (- n 2)))

(f 10)

(define (f n)
  ;; Implementation of a recursive process  
  (cond ((< n 3) n)
	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))
(f 10)


;;;
;;;




