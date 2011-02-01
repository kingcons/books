(define (mul-interval x y) ;;even with lets this is ugly. i object!
  (let ((a (lower-bound x))
	(b (upper-bound x))
	(c (lower-bound y))
	(d (upper-bonud y)))
    (cond ((and (> a 0) (> b 0) (> c 0) (> d 0))
	   (make-interval (* a c) (* b d)))
	  ((and (> a 0) (> b 0) (< c 0) (> d 0))
	   (make-interval (* b c) (* b d)))
	  ((and (< a 0) (> b 0) (> c 0) (> d 0))
	   (make-interval (* a d) (* b d)))
	  ((and (< a 0) (> b 0) (< c 0) (< d 0))
	   (make-interval (* b d) (* a d)))
	  ((and (< a 0) (< b 0) (< c 0) (> d 0))
	   (make-interval (* b d) (* b c)))
	  ((and (< a 0) (< b 0) (< c 0) (< d 0))
	   (make-interval (* a c) (* b d)))
	  ((or (and (> a 0) (> b 0) (< c 0) (< d 0))
	       (and (< a 0) (< b 0) (> c 0) (> d 0)))
	   (make-interval (* b d) (* a c)))
	  (else (make-interval (min (* a d) (* b c))
			       (max (* a c) (* b d)))))))
;Value: mul-interval

;;supplementary functions:
(define (make-interval a b)
  (cons a b))
;Value: make-interval

(define (lower-bound x)
  (car x))
;Value: lower-bound

(define (upper-bound x)
  (cdr x))
;Value: upper-bound