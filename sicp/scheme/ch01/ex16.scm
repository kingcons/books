;;This was tricky until I modeled the state transformations holding to the rule suggested for (* a (b^n)). Once I did that it was pretty easy.

(define (expt b n)
  (define (expt-iter b n a)
    (cond ((= n 0) a)
	  ((even? n) (expt-iter (square b) (/ n 2) a))
	  (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))
;Value: expt
