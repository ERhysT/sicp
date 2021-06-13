;;; Observe that our model of evaluation allows for combinations whose
;;; operators are compound expressions. Use this observation to
;;; describe the behaviour of the following procedure.

(define (a-plus-abs-b a b)
  ;; In the case b is greater than 0, the if statement evaluates to +,
  ;; otherwise it is -. This sign is then the first element in a list
  ;; so it is applied to a and b. if b is negative, b is subtracted
  ;; negating the effect and providing absolute value of b.
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -10)
