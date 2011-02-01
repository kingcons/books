(define (horners-rule x coef-sequence)
  (accumulate (lambda (head tail) (+ head (* x tail))) ;;Read horner's rule right to left.
	      0 coef-sequence))
;Value: horners-rule

(horners-rule 2 (list 1 3 0 5 0 1))
;Value: 79

;;supplementary functions:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

