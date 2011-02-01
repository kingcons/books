(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x)) rest)))))
;Value: subsets

(define x (list 1 2 3))
;Value: x

(subsets x)
;Value 17: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;;Why does this work? Why was (cons (car s) x) necessary? We are joining the subsets of the cdr with the subsets of the car.
