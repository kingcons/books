a.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))
;Value: product

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))
;Value: factorial

(define (pi-approx approximations)
  (define (pi-term denom) (/ (- (square denom) 1) (square denom)))
  (define (next-term denom) (+ denom 2))
  (product pi-term 3 next-term approximations))
;Value: pi-approx

;;I just rewrote this code. I couldn't read it anymore. At 
least, I wasn't sure what I was doing or if it was right. After 
rewriting I've remembered what I was doing and why it IS right. So I've 
changed some variable names and here's a little comment to explain. 
Instead of computing individual terms (i.e. 1 is 2/3, 2 is 4/3, 3 is 
4/5, etc) I compute the product of terms that share a denominator (i.e. 
terms 1 and 2 have denominator 3 and their product is 8/9, terms 3 and 
4 have denominator 4 and their product is 24/25, etc). Naturally, I 
start with the first denominator (3) and then each successive 
approximation uses the next denominator which is two greater than the 
last one.

b.
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(* (term a)
	   (product term (next a) next b))))
  (iter a 1))
;Value: product
