(define (deep-reverse items)
  (cond ((
        ((pair? items) (reverse (cons (reverse (car items))
				      (reverse (cdr items)))))
	(else '())))
;Value: deep-reverse

(define squares (list 1 2 3 4 5))
;Value: squares

(define x (list (list 1 2) (list 3 4)))
;Value: x

(reverse x)
;Value 15: ((3 4) (1 2))

(deep-reverse x)
;Value 26: ((3 4) (2 1))

;;supplementary functions:
(define (reverse items)
  (define (reverse-iter count)
    (if (= count 0)
	'()
	(cons (list-ref items (- count 1))
	      (reverse-iter (- count 1)))))
  (reverse-iter (length items)))
;Value: reverse

