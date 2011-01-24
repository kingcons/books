;;A tree recursive process that computes f is demonstrated in the following procedure:

(define (f n)
  (cond ((< n 3) n)
	((or (= n 3) (> n 3))
	 (+ (f (- n 1))
	    (* 2 (f (- n 2)))
	    (* 3 (f (- n 3)))))))
;Value: f

;;An iterative process that computes f is demonstrated in the following procedure:

(define (f n)
  (f-iter 2 1 0 n))
;Value: f

(define (f-iter a b c count)
  (cond ((< count 3) count)
	(else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
;Value: f-iter

;;Figuring out the iterative process was scary. It was the first moment I thought I wouldn’t be able to do this and might need real help. I was unsure of whether I needed three or four state variables. It clicked after a few minutes of thinking though and was much smoother from there.
