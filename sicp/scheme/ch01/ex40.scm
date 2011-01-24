(define (cubic a b c)
  (lambda (x) (+ (expt x 3) (* a (expt x 2)) (* b x) c)))
;Value: cubic

(define dx 0.00001)
;Value: dx

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
;Value: fixed-point-of-transform

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
;Value: deriv

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
;Value: newton-transform

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
;Value: newtons-method

;; I didn’t realize I just needed to literally translate the function. after I knew that I was fine. again, time to study more math.

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
