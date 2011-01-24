;;The code for this exercise is not particularly difficult. It’s not easy but it’s fairly straightforward. Because this exercise was written over 10 years ago though it’s pretty difficult to use on modern hardware. You’re supposed to observe algorithmic efficiency because this code is supposed to stress your hardware. Unfortunately, in 2008 this code makes my hardware yawn for numbers on the scale they were asking for. So I started things off at 13 digits and scaled up from there. I also decided to rework the code so that it only outputs when it finds a prime.

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

;;supplementary functions:
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
;Value: find-divisor

(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?