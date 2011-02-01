(define (find-triples n s)
  (define (sums-to-s? triple)
    (= (cadddr (make-triple-sum triple)) s))
  (map make-triple-sum
       (filter sums-to-s?
	       (unique-triples n))))
;Value: find-triples

(define (make-triple-sum triple)
  (list (car triple)
	(cadr triple)
	(caddr triple)
	(+ (car triple)
	   (cadr triple)
	   (caddr triple))))
;Value: make-triple-sum

(define (unique-triples n)
  (flatmap
   (lambda (pairs)
     (map (lambda (k) (list (car pairs) (cadr pairs) k))
	  (enumerate-interval 1 (- n 2))))
  (unique-pairs n)))
;Value: unique-triples

(unique-triples 4)
;Value 14: ((2 1 1) (2 1 2) (3 1 1) (3 1 2) (3 2 1) (3 2 2) (4 1 1) (4 1 2) (4 2 1) (4 2 2) (4 3 1) (4 3 2))

(find-triples 4 8)
;Value 15: ((4 2 2 8) (4 3 1 8))

;;supplementary functions:
(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))
;Value: flatmap

(define (enumerate-interval start end)
  (if (> start end)
      '()
      (cons start (enumerate-interval (+ start 1) end))))
;Value: enumerate-interval

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
	  (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
;Value: unique-pairs
