;;There are a number of tricky things about this exercise. The first real stumbling block is that we need to recurse to traverse a tree and accumulate doesn't traverse. The original count-leaves you'll remember is similar to enumerate-tree which traverses a tree and returns a list of that trees leaves. This means that if you weren't required to use accumulate and map you could just rewrite count-leaves as follows:

(define (count-leaves t)
  (length (enumerate-tree t)))
;Value: count-leaves

;;Apparently, that's too damn easy. We can use map and enumerate-tree to turn the tree into a list. For some reason, this doesn't quite succeed. If you run (length (map enumerate-tree items)) it returns 3 instead of 4 for (define items (cons (list 1 2) (list 3 4)).

(map enumerate-tree items)
;Value 12: ((1 2) (3) (4))

;;And anyway, we'd still have to accumulate it. The solution is to use map, enumerate-tree and a lambda to return a flat list with a 1 representing each leaf and just accumulate that.

(accumulate + 0 (map (lambda (x) 1)
		     (enumerate-tree items)))
;Value: 4

;;supplementary functions:
(define items (cons (list 1 2) (list 3 4)))
;Value: items

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))
;Value: enumerate-tree


