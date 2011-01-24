(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; this procedure decides whether to add b to a or subtract b from a
;; based on whether or not b is greater than 0. as a consequence, it
;; adds the absolute value of b to a.
