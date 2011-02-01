(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
	(p2 (- (lower-bound x) (upper-bound y)))
	(p3 (- (upper-bound x) (lower-bound y)))
	(p4 (- (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: sub-interval

;;Similiar to the addition function the maximum value the difference could be is that of the furthest upper and lower bound and the minimum difference is that of the closest upper and lower bound. This seems to be the best way to test for that.

;;supplementary functions:
(define (make-interval a b)
  (cons a b))
;Value: make-interval

(define (lower-bound i)
  (car i))
;Value: lower-bound

(define (upper-bound i)
  (cdr i))
;Value: upper-bound