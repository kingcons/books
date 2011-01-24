(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* .000001 guess)))
