(define (cons x y)
  (lambda (m) (m x y)))
;Value: cons

(define (car z)
  (z (lambda (p q) p)))
;Value: car

(define (cdr z)
  (z (lambda (p q) q)))
;Value: cdr

;;wow.