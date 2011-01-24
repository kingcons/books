(define (euler-expand)
  (define (d-fun i)
    (cond ((= (modulo i 3) 2) (* (ceiling (/ i 3)) 2))
	  (else 1)))
  (cont-frac (lambda (i) 1.0) d-fun 8))
;Value: euler-expand

;;supplementary functions:
(define (cont-frac n d k)
  (define (frac-iter i)
    (if (< i k)
	(/ (n i) (+ (d i) (frac-iter (+ i 1))))
	(/ (n i) (d i))))
  (frac-iter 1))
;Value: cont-frac
