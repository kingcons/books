a.
(define (cont-frac n d k)
  (define (frac-iter i)
    (if (< i k)
	(/ (n i) (+ (d i) (frac-iter (+ i 1))))
	(/ (n i) (d i))))
  (frac-iter 1))
;Value: cont-frac

b.
(define (cont-frac n d k)
  (define (frac-iter count result)
    (if (= count 0)
	result
	(frac-iter (- count 1)
		   (/ (n count) (+ (d count) result))))
  (frac-iter k 0)))
;Value: cont-frac