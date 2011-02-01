(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (fold-right op init (cdr seq)))))
;Value: fold-right

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter init seq))
;Value: fold-left

(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-left / 1 (list 1 2 3))
;Value: 1/6

(fold-right list '() (list 1 2 3))
;Value 12: (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
;Value 13: (((() 1) 2) 3)

(fold-right * 1 (list 1 2 3))
;Value: 6

(fold-left * 1 (list 1 2 3))
;Value: 6

(fold-right - 1 (list 1 2 3))
;Value: 1

(fold-left - 1 (list 1 2 3))
;Value: -5

(fold-right + 1 (list 1 2 3))
;Value: 7

(fold-left + 1 (list 1 2 3))
;Value: 7

;;Commutativity is the desired property. Does this remind anyone else of Exercise 2.9?