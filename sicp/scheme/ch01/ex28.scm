(define (expmod base exp m)
  (define (miller-rabin x)
    (and (not (= x 1)) (not (= x m)) (= (square x) (modulo 1 m))))
  (cond ((= exp 0) 1)
	((even? exp)
	 (if (miller-rabin (square (expmod base (/ exp 2) m)))
	     0
	     (remainder (square (expmod base (/ exp 2) m))
			m)))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

(define (miller-rabin-search n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))
;Value: miller-rabin-search

(define (miller-rabin-test n)
  (define (mr-iter count)
    (cond ((= count 1) #t)
	  ((miller-rabin-search n) (mr-iter (- count 1)))
	  (else #f)))
  (mr-iter (floor (/ n 2))))
;Value: miller-rabin-test

;;I got everything written right on this one but I had to check Ken's page again to notice that my try-it definition was testing the expmod result against a, not 1. Once I fixed that I was right as rain.