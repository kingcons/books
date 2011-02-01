(define (reverse items)
  (fold-right (lambda (x y) (cons y x)) '() items))
;Value: reverse

(reverse junk)
;Value 12: (((((() . 25) . 16) . 9) . 4) . 1)

(define (reverse items)
  (fold-left (lambda (x y) (cons y x)) '() items))
;Value: reverse

(reverse junk)
;Value 14: (25 16 9 4 1)

;;supplementary functions:
(define junk (list 1 4 9 16 25))
;Value: junk