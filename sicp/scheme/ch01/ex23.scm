(define (find-divisor n test-divisor)
  (cond ((> (square n) n) n)
	((= (modulo n test-divisor) 0) test-divisor)
	(else (find-divisor n (next test-divisor)))))
;Value: find-divisor

(define (next n)
  (cond ((even? n) (+ n 1))
        (else (+ n 2))))
;Value: next

;;supplementary functions:
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n)))
;Value: start-prime-test

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?

