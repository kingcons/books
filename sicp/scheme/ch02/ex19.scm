(define no-more? null?)
;Value: no-more?

(define (first-denomination coins)
  (car coins))
;Value: first-denomination

(define (except-first-denomination coins)
  (cdr coins))
;Value: except-first-denomination

;;apparently changing the order of the coins doesn't matter but i'm not sure why. i'll figure it out later. :)

;;supplementary functions:
(define us-coins (list 50 25 10 5 1))
;Value: us-coins

(define uk-coins (list 100 50 20 10 5 2 1 0.5))
;Value: uk-coins

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))
;Value: cc
