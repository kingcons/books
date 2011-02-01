(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x))
     2))
;Value: width-interval

(width-interval (mul-interval inter1 inter2))
;Value: 24

(width-interval (div-interval inter1 inter2))
;Value: .5333333333333334

(width-interval (add-interval inter1 inter2))
;Value: 4

(width-interval (sub-interval inter1 inter2))
;Value: 4

;;Observe that the width of the interval which is the difference between inter1 and inter 2 is identical to the width of the interval which is the sum of inter1 and inter2.
;;This fact indicates that the width of summed or subtracted intervals is a function of the width of their source intervals. You can clearly see that the width of the intervals produced by multiplying or dividing inter1 and inter2 do not share this trait. Thus, the width of multiplied or divided intervals is not a function of their source intervals alone.

;;supplementary functions:
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
;Value: mul-interval

(define (div-interval x y)
  (if (<= (or (upper-bound y) (lower-bound y)) 0)
      (error "Cannot divide by an interval that spans zero." y)
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))
;Value: div-interval

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
;Value: add-interval

(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
	(p2 (- (lower-bound x) (upper-bound y)))
	(p3 (- (upper-bound x) (lower-bound y)))
	(p4 (- (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: sub-interval

(define (make-interval a b)
  (cons a b))
;Value: make-interval

(define (lower-bound i)
  (car i))
;Value: lower-bound

(define (upper-bound i)
  (cdr i))
;Value: upper-bound

(define inter1 (make-interval 3 7))
;Value: inter1

(define inter2 (make-interval 5 9))
;Value: inter2

