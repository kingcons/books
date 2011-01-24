(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (k-term x)
    (cond ((or (= x 0) (= x n)) 1)
	    ((even? x) 2)
	      (else 4)))
  (define (yk x)
    (* (k-term x)
       (f (+ a (* x h)))))
  (* (sum yk a inc n)
     (/ h 3)))
;Value: simpsons-rule

;;supplementary functions:
(define (cube x) (* x x x))
;Value: cube

(define (inc x) (+ x 1))
;Value: inc

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))
;Value: sum

