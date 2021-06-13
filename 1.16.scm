(define (expt b n)
  (iter b n 1))
(define (iter b n product)
  (cond ((= n 0) product)
	((even? n) (iter b (/ n 2) (* product product)))
	(else (iter b (- n 1) (* product b)))))

(expt 2 10)
(expt 3 5)




