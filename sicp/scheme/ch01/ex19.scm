;;This was just a really difficult problem to understand. I wasn’t even sure what they were really asking. Once I realized I just needed to use algebra to try and expand and then factor out a few things I felt a lot more comfortable.

(define (fib n)
  (fib-iter 1 0 0 1 n))
;Value: fib

(define (fib-iter a b p q count)
  (cond ((= count 0 ) b)
	((even? count)
	  (fib-iter a
		    b
		    (+ (square p) (square q)) ;; compute p'
		    (+ (* 2 p q) (square q))  ;; compute q'
		    (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))
;Value: fib-iter