(define (lower-bound i)
  (car i))
;Value: lower-bound

(define (upper-bound i)
  (cdr i))
;Value: upper-bound

;;supplementary functions:
(define (make-interval a b)
  (cons a b))
;Value: make-interval