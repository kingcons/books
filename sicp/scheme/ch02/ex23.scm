(define (for-each proc items)
  (cond ((null? (cdr items)) (proc (car items))
			     true)
	(else (proc (car items))
	      (for-each proc (cdr items)))))
;Value: for-each

(for-each (lambda (x) (newline)(display x))
	  (list 1 2 3))

1
2
3
;Value: #t