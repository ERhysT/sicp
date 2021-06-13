(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))			; rounding
(p (p (p 0.4351)))
(p (p 0.9758))
(p -0.7895) 
-0.3998

;; a) p is applied whenever the absolute value of angle remains above
;; 0.1 radians. in the case of 12.15 this is 5 times.

;; b) In terms of both steps and growth in space, the size of the
;; process is proportional to the log of the angle: O(log(a)). E.g.
;; for 12.15 radians
(ceiling (/ (log (/ 12.15
		    0.1))
	    (log 3)))			; => 5.0

