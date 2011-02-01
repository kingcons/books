(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; Given the above definition of Ackermann's function,
;; (A 0 n) == 2n
;; (A 1 n) == 2^n
;; (A 2 n) == 2^(ack (n-1)) for n > 1, 2 otherwise
