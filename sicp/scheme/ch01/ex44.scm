(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
;Value: smooth

(define (n-smoothed f n)
  (repeated smooth n) f)
;Value: n-smoothed

;;check theloserblog-home.blogspot.com for a potentially better answer

;;supplementary functions:
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
;Value: repeated

(define (compose f g)
  (lambda (i) (f (g i))))
;Value: compose
