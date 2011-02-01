(define (unique-pairs n)
  (flatmap 
   (lambda (i)
     (map (lambda (j) (list i j))
	  (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
;Value: unique-pairs

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;Value: make-pair-sum

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;Value: prime-sum?

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (unique-pairs n))))
;Value: prime-sum-pairs

(prime-sum-pairs 6)
;Value 7: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))

;;I knew that unique-pairs should just be the flatmap section of their prime-sum-pairs function but for some reason I expected it to produce the same results as permutations. Clearly, I was out of my mind or as von Neumann puts it "in a state of sin".

;;supplementary functions:
(define (enumerate-interval start end)
  (if (> start end)
      '()
      (cons start (enumerate-interval (+ start 1) end))))
;Value: enumerate-interval

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))
;Value: flatmap

(define (prime? n)
  (= (smallest-divisor n) n))
;Value: prime?

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (find-divisor n test-divisor)
  (if (= (modulo n test-divisor) 0)
      test-divisor
      (find-divisor n (next test-divisor))))
;Value: find-divisor

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))
;Value: next
