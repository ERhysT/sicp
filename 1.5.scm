;;; Ben Bitdiddle has invented a test to determine whether the
;;; interpreter he is faced with is using applicative order evaluation
;;; or normal order evaluation. He defines the following two
;;; proceedures.

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; APPLICATIVE ORDER EVALUATION (evaluate the arguments then apply)
;; hangs because (p) keeps evaluating to itself

;;; NORMAL ORDER EVALUATION (fully expand then reduce) evaluates to 0
;;; because the branch with formal paramter y=(p) is not evaluated.
