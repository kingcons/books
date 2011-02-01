(define x (list 1 2 3))
;Value: x

(define y (list 4 5 6))
;Value: y

(append x y)
;Value 11: (1 2 3 4 5 6)

(cons x y)
;Value 12: ((1 2 3) 4 5 6)

(list x y)
;Value 13: ((1 2 3) (4 5 6))

;;I wrote all these out correctly on paper and used the REPL for confirmation. Still, I'm confused why the behavior for cons is the way it is. I should go look at the code for it again.