a.
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))
;Value: accumulate
 
(define (sum term a next b)
  (accumulate + 0 term a next b))
;Value: sum
 
(define (product term a next b)
  (accumulate * 1 term a next b))
;Value: product

b.
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	null-value
	(combiner (term a)
		  (iter (next a) result))))
  (iter a null-value))
;Value: accumulate
