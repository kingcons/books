(define x (list (list 1 2) (list 3 4)))
;Value: x

(define y (list 1 3 (list 5 (list 7 9)) 13))
;Value: y

(define (fringe items)
  (cond ((null? items) '())
	((not (pair? items)) (list items))
	(else (append (fringe (car items))
		      (fringe (cdr items))))))
;Value: fringe

(fringe x)
;Value 16: (1 2 3 4)

(fringe y)
;Value 17: (1 3 5 7 9 13)

;;Why do append and list need to be used, why not cons or something?