(define (reverse items)
  (define (reverse-iter count)
    (if (= count 0)
	'()
	(cons (list-ref items (- count 1))
	      (reverse-iter (- count 1)))))
  (reverse-iter (length items)))
;Value: reverse

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

;;;;; ALTERNATE SOLUTION
;; I whipped this up while working on exercise 2.39. It's a recursive version and it doesn't generate clean lists.
;; I still haven't quite figured that out.

(define (reverse items)
  (if (null? items)
      '()
      (cons (reverse (cdr items))
            (car items))))

;;supplementary functions:
(define (last-pair items)
  (if (null? (cdr items))
      (car items)


      (last-pair (cdr items))))

;;;;;IMPROVED ALTERNATE
(define (reverse items)
  (if (null? items)
      '()
      (append (list (reverse (cdr items)))
	      (list (car items)))))