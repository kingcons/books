(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))
;Value: square-list

(define squares (list 1 2 3 4))
;Value: squares

;;Due to the order of arguments to cons the list is constructed from the back forwards causing it to appear in reverse. One would think exechanging the order of arguments would resolve the issue...

(square-list squares)
;Value 11: (16 9 4 1)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))
;Value: square-list

(square-list squares)
;Value 12: ((((() . 1) . 4) . 9) . 16)

;;While the numbers are now in the right order, per se, the spacing is all screwed up because of the evaluation order again. The initial nil value causes the first evaluation to return (()1) and the second evalation conses that with 4 resulting in ((()1)4) and so on. This front-loading of the parens makes it look all messed up. I would argue that it did "technically" work though. They are in the right order, after all.

;;What you really need is an iterative map implementation to define square-list in terms of.








