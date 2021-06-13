;;; Ex 1.9: Each of the following two procedures defines a method for
;;; adding two positive integers in terms of the procedures inc, which
;;; increments its argument by 1, and dec, witch decrements its
;;; argument by 1

;;; This a linear recursive process as a chain of deferred operations,
;;; in this case the indreament proceedure grows proportional to a and
;;; contracts after reaching a maximum.
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))
;;; (+ 4 5)
;;; (inc (+ (dec 4) 5))
;;; (inc (inc (+ (dec 3) 5)))  
;;; (inc (inc (inc (+ (dec 2) 5)))
;;; (inc (inc (inc (inc (+ (dec 1) 5)))
;;; (inc (inc (inc (inc 5)))))
;;; (inc (inc (inc 6)))
;;; (inc (inc 7))
;;; (inc 8)
;;; 9

;;; This is a linear iterative process as the state of the operation
;;; is defined by state varaibles (a, b) which are updated by a fixed
;;; rule a number of times directly proportional to the magnitude of
;;; a, with an end test provided to terminate this process. As the
;;; proceedure calls it's self it is a recursive proceedure,
;;; nevertheless the process is an iterative one.
(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))
;;; (+ 4 5)
;;; (+ (dec 4) (inc 5))) 
;;; (+ (dec 3) (inc 6)))
;;; (+ (dec 2) (inc 7))) 
;;; (+ (dec 1) (inc 8))) 
;;; 9



;;; NOTES: The easiest way to spot that the first process is recursive
;;; (without writing out the substitution) is to note that the "+"
;;; procedure calls itself at the end while nested in another
;;; expression; the second calls itself, but as the top expression.
