(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (* guess guess)))
   3))

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* .000001 guess)))

(define (cube-root x)
  (cube-iter 1 x))

;; Now exhibiting lexical/block structure
;; 1 Global function vs 5 above
(define (cube-root-v2 x)
  (define (improve guess)
    (/ (+ (* 2 guess) (/ x (* guess guess)))
       3))
  (define (cube-iter guess)
    (if (good-enough? guess)
        guess
        (cube-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (improve guess) guess))
       (* .000001 guess)))
  (cube-iter 1))
