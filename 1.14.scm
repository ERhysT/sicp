(define (count-coins amount)
  ;; computes the number of ways to change any given amount of money
  (define (denom-value index)
    ;; Ordered list of denomination values, returns value of largest
    ;; denomination.
    (cond ((= index 1) 1)
	  ((= index 2) 5)
	  ((= index 3) 10)
	  ((= index 4) 20)
	  ((= index 5) 50)))
  (define (cc remainder denoms)
    ;; The number of ways to change amount equals the sum of:
    ;;
    ;;   - Number of ways to change amount a using all except the 1st
    ;;   denom in an ordered list
    ;;
    ;;   - Number of ways to change remainder (of amount and value of
    ;;   1st denom) using all the denominations
    (cond ((= remainder 0) 1)
	  ((or (= denoms 0) (< remainder 0)) 0)
	  (else (+ (cc (- remainder (denom-value denoms)) denoms)
		   (cc remainder (- denoms 1))))))
  (cc amount 5))

(count-coins 10)			; expanded into tree
;;; (cc 10 5) 
;;; |----(cc -40 5) => 0  
;;; |----(cc 10 4)
;;;   	 |----(cc -15 4) => 0 
;;;   	 |----(cc 10 3)
;;;   	      |----(cc 0 3) => 1
;;;   	      |----(cc 10 2)
;;;   	     	   |----(cc 5 2)
;;;   	     	   | 	|----(cc 0 2) => 1
;;;   	     	   | 	|----(cc 5 1)
;;;   	     	   | 	     |----(cc 0 1) => 1
;;;   	     	   | 	     |----(cc 5 0) => 0
;;;   	     	   |----(cc 10 1)
;;;   	     	     	|----(cc 9 1)
;;;   	     	     	|    |----(cc 8 1)
;;;   	     	     	|    |     |----(cc 7 1)
;;;   	     	     	|    |     |    |----(cc 6 1)
;;;   	     	     	|    |     |    |    |----(cc 5 1)
;;;   	     	     	|    |     |    |    |    |----(cc 4 1)
;;;   	     	     	|    |     |    |    |    |    |----(cc 3 1)
;;;   	     	     	|    |     |    |    |    |    |    |----(cc 2 1)
;;;   	     	     	|    |     |    |    |    |    |    |    |----(cc 1 1)
;;;   	     	     	|    |     |    |    |    |    |    |    |    |----(cc 0 1) => 1
;;;   	     	     	|    |     |    |    |    |    |    |    |    |----(cc 1 0) => 0
;;;   	     	     	|    |     |    |    |    |    |    |    |----(cc 2 0) => 0
;;;   	     	     	|    |     |    |    |    |    |    |----(cc 3 0) 
;;;   	     	     	|    |     |    |    |    |    |----(cc 4 0) => 0
;;;   	     	     	|    |     |    |    |    |----(cc 5 0) => 0
;;;   	     	     	|    |     |    |    |----(cc 6 0) => 0
;;;   	     	     	|    |     |    |----(cc 7 0) => 0
;;;   	     	     	|    |     |----(cc 8 0) => 0
;;;   	     	     	|    |----(cc 9 0) => 0
;;;   	     	     	|-(cc 10 0) => 0
;;;         
;;; space O(n)
;;; time  O(2^n) ???
