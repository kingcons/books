(define (start-prime-test n start-time)
  (if (fast-prime? n 500)
      (report-prime (- (runtime) start-time) n)))
;Value: start-prime-test

;;supplementary functions:
(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))
;Value: report-prime

(define (search-for-primes current end)
  (cond ((even? current) (search-for-primes (+ current 1) end))
	((> current end) (display " done! "))
	(else (timed-prime-test current)
	      (search-for-primes (+ current 2) end))))
;Value: search-for-primes

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
;Value: fast-prime?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
		    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
;Value: fermat-test