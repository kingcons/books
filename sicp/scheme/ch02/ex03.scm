;;representation 1 - procedure based, working by magic:
(define (rect-area r)
  (* (length r) (width r)))
;Value: rect-area

(define (rect-perimeter r)
  (* 2 (+ (length r) (width r))))
;Value: rect-perimeter

(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))
;Value: make-rect

(define (length r)
  (- (y-point (car r)) (y-point (cdr r))))
;Value: length

(define (width r)
  (- (x-point (cdr r)) (x-point (car r))))
;Value: width

;;representation 2 - not procedure based, working by reality:
(define (make-rect top bottom)
  (cons top bottom))
;Value: make-rect

(define (rect-top r)
  (car r))
;Value: rect-top

(define (rect-bottom r)
  (cdr r))
;Value: rect-bottom

(define (rect-left r)
  (make-segment (start-segment top)
		(start-segment bottom)))
;Value: rect-left

(define (rect-right r)
  (make-segment (end-segment top)
		(end-segment bottom)))
;Value: rect-right

(define (length r)
  (- (y-point (start-segment (rect-top r)))
     (y-point (start-segment (rect-bottom r)))))
;Value: length

(define (width r)
  (- (x-point (end-segment (rect-top r)))
     (x-point (start-segment (rect-top r)))))
;Value: width

;;supplementary functions:
(define (make-point x y)
  (cons x y))
;Value: make-point

(define (x-point point)
  (car point))
;Value: x-point

(define (y-point point)
  (cdr point))
;Value: y-point

(define (make-segment p1 p2)
  (cons p1 p2))
;Value: make-segment

(define corner-1 (make-point 2 8))
;Value: corner-1

(define corner-2 (make-point 8 2))
;Value: corner-2

(define rect-1 (make-rect corner-1 corner-2))
;Value: rect-1

;;supplementary functions for representation 2:
(define (start-segment s)
  (car s))
;Value: start-segment

(define (end-segment s)
  (cdr s))
;Value: end-segment

(define side-1 (make-segment (make-point 2 8) (make-point 8 8)))
;Value: side-1

(define side-2 (make-segment (make-point 2 2) (make-point 2 8)))
;Value: side-2

(define rect-1 (make-rect side-1 side-2))
;Value: rect-1

(rect-area rect-1)
;Value: 36

(rect-perimeter rect-1)
;Value: 24

;;what working by magic really ends up doing is making the cruft that's unnecessary to your implementation obvious.