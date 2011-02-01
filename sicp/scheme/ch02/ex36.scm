(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))
;Value: accumulate-n

(define items (list (list 1 2 3)
		    (list 4 5 6)
		    (list 7 8 9)
		    (list 10 11 12)))
;Value: items

(accumulate-n + 0 items)
;Value 13: (22 26 30)

;;I thought this would be easy, banged my head trying to implement something from the ground up and then tried using existing constructs. I felt pretty dumb when I realized map was all that was needed. I strongly recommend you read footnote 12 in Section 2.2

;;supplementary functions:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

