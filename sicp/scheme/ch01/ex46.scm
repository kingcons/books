(define (iterative-improve tester improver)
  (define (iter guess x)
    (if (tester guess)
	guess
	(iter (improver guess) x)))
  (lambda (x) (iter 1.0 x)))
;Value: iterative-improve

(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) 0.00001))
    (lambda (guess) (average guess (/ x guess)))) x))
;Value: sqrt

(define (fixed-point f x)
  ((iterative-improve
    (lambda (guess) (< (abs (- guess (f guess))) 0.00001))
    (lambda (guess) (f guess))) x))
;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7390893414033927

;;supplementary functions:
(define (average x y)
  (/ (+ x y) 2))
;Value: average
