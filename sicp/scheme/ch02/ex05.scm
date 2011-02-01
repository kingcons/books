(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
;Value: cons

(define (what-exponent x y)
  (define (exp-iter count)
    (if (= (modulo y (expt x count)) 0)
	(exp-iter (+ count 1))
	(- count 1)))
  (exp-iter 1))
;Value: what-exponent

(define (car x)
  (what-exponent 2 x))
;Value: car

(define (cdr x)
  (what-exponent 3 x))
;Value: cdr