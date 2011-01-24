(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: fixed-point

(define (solve-for-x)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
;Value: solve-for-x
 
(define (solve-for-x)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
;Value: solve-for-x
 
;;pretty impressive. solve-for-x went from taking 34 steps to 9 steps thanks to average damping. wonder what it does for golden ratio? and sqrt's at various levels...
