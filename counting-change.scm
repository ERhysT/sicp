;;; Counting change - a proceedure to compute the number of ways to
;;; change any given amount of money
;;;
;;; If you think of the coins avaliable as arranged in some order then
;;; the following relation holds:
;;;
;;; The number of ways to change amount a using n kinds of coins
;;; equals:
;;;
;;;   - The number of ways to change amount a using all but the first
;;;   kind of coin.
;;;
;;;   - The number of ways to change amound a - d using
;;;   all n kinds of coins where d is the denomination of the first
;;;   kind of coin.
;;;
;;; For example, giving change for 5p using 1p and 5p coins.
;;; 
;;; Assuming ordered by decreaseing value first kind of coin d = 5p
;;;
;;; Without using 5p, (5x 1p) = 1 way
;;; With 5p as first coin (5p + 5p ) = 1 way

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0))
)
(define (first-denomination kinds-of-coins)
  ;; Takes as input the number of coins avaliable and returns the
  ;; denomination of the first kind. Coins are arranged in order from
  ;; largest to smallest.
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))

