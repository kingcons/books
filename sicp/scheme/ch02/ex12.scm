(define (make-center-percent center tolerance)
  (make-center-width center (* (/ tolerance 100) center)))
;Value: make-center-percent

(define (percent i)
 (* (/ (width i) (center i)) 100))
;Value: percent

(percent (make-center-percent 8 5))
;Value: 5

;;supplementary functions:
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-center-width

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: center

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;Value: width

(define (make-interval a b)
  (cons a b))
;Value: make-interval

(define (lower-bound i)
  (car i))
;Value: lower-bound

(define (upper-bound i)
  (cdr i))
;Value: upper-bound