(define (div-interval x y)
  (if (<= (or (upper-bound y) (lower-bound y)) 0)
      (error "Cannot divide by an interval that spans zero." y)
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))
;Value: div-interval

;;This fixes the issue of dividing by zero in the software by simply not allowing intervals to drop below zero. Whether intervals that "span" zero should be allowed is up for debate.

;;supplementary functions:
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
;Value: mul-interval
