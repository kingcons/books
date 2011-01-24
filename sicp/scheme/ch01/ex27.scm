(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m)) m))
	(else
	 (remainder (* base (expmod base (- exp 1) m)) m))))
;Value: expmod

(define (carmichael-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (carmichael-iter times)
    (cond ((= times 0) true)
	  ((try-it times) (carmichael-iter (- times 1)))
	  (else false)))
  (carmichael-iter (- n 1)))
;Value: carmichael-test