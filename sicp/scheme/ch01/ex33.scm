(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
	((filter a) (combiner (term a)
			      (filtered-accumulate combiner null-value term
						   (next a) next b filter)))
	(else (filtered-accumulate combiner null-value term
				   (next a) next b filter))))
;Value: filtered-accumulate
 
a.
(define (sum-square-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))
;Value: sum-square-primes

b.
(define (product-relative-primes n)
  (define (relatively-prime i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime))
;Value: product-relative-primes

;;supplementary functions:
(define (inc x) (+ x 1))
;Value: inc

(define (identity x) x)
;Value: identity

(define (prime? n)
  (= (smallest-divisor n) n))
;Value: prime?

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((= (modulo n test-divisor) 0) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
;Value: find-divisor

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;Value: gcd
