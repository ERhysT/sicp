(define (fib-tree n)
  ;; Determine Fibonacci number n using recursive tree process
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib-tree (- n 1)) (fib-tree (- n 2))))))

(define (fib-iterative n)
  ;; Determine Fibonacci number using iterative process
  (define (iter a b count)
    (if (= count 0) b
	(iter (+ a b) a (- count 1))))
  (iter 1 0 n))

(= (fib-tree 10) (fib-iterative 10) 55)

