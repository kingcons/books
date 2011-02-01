(define (map proc items)
  (accumulate (lambda (head tail) (cons (proc head)
				       tail))
	      '() items))
;Value: map

(map square (list 1 2 3 4))
;Value 13: (1 4 9 16)

(define (append list-1 list-2)
  (accumulate cons list-2 list-1 ))
;Value: append

(append squares primes)
;Value 16: (1 4 9 16 25 7 11 13 17 19)

(define (length items)
  (accumulate (lambda (head tail) (+ 1 tail))
		0 items))
;Value: length

(length (list 1 2 3 4))
;Value: 4

;;supplementary functions:
;;I strongly advise going ahead and typing in the supplementary functions for this problem. There are two reasons. First off, accumulate isn't provided standard by my environment. Second, being able to see the definitions makes it much easier to figure out the substitutions. This particularly made append clear for me. I found the substitutions for map and append more difficult to follow though map is probably the most complex as it needs to output a new list.
(define squares (list 1 4 9 16 25))
;Value: squares

(define primes (list 7 11 13 17 19))
;Value: primes

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
;Value: append

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))
;Value: length






















































