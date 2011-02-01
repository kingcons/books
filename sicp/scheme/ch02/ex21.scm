(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
	    (square-list (cdr items)))))
;Value: square-list

(define (square-list items)
  (map (lambda (x) (* x x))
       items))
;Value: square-list

