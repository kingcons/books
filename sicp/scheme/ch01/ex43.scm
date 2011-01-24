(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
;Value: repeated

;;Wow! That was a lot easier to think about using compose.

;;supplementary functions:
(define (compose f g)
  (lambda (i) (f (g i))))
;Value: compose
