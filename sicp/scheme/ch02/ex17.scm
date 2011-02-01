(define (last-pair items)
  (list-ref items (- (length items) 1)))
;Value: last-pair

;;supplementary functions:
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
;Value: list-ref

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;Value: length

