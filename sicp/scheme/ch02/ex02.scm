(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (positive? (/ n d))
	(cons (abs (/ n g)) (abs (/ d g)))
	(cons (- (/ n g)) (abs (/ d g))))))
;Value: make-rat

;;supplementary functions:
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;Value: gcd
