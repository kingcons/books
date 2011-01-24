(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: average-damp

(define (nth-root x n)
  (fixed-point (repeated
		(average-damp (lambda (y) (/ x (expt y (- n 1)))))
		(ceiling (/ n 2))) 1.0))
;Value: nth-root

;;after testing the first 15 powers with my version of nth-root I couldn't figure out the relationship between n and the times to average damp. just about everyone had trouble with this but i found the correct answer in eli's comment thread...
 
(define (nth-root x n)
  (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1))))
			    (repeated average-damp (log2 n)) 1.0))
;Value: nth-root

(define (log2 n)
  (if (= 1 n)
      0
      (+ (log2 (floor (/ n 2))) 1)))
;Value: log2

;;supplementary functions:
(define tolerance 0.00001)
;Value: tolerance

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: fixed-point

(define (average x y)
  (/ (+ x y) 2))
;Value: average 

(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
;Value: repeated

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
;Value: fixed-point-of-transform