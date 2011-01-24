(define (tan-cf x k)
  (define (d i)
    (- (* 2 i) 1))
  (define (n i)
    (if (= x 1)
	x
	(square x)))
  (cont-frac n d k))
;Value: tan-cf

;;supplementary functions:
(define (cont-frac n d k)
  (define (frac-iter i)
    (if (< i k)
	(/ (n i) (- (d i) (frac-iter (+ i 1))))
	(/ (n i) (d i))))
  (frac-iter 1))
;Value: cont-frac
