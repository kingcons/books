(in-package :sicp)

(defun a-plus-abs-b (a b)
  (apply (if (plusp b) '+ '-) (list a b)))

;; this procedure decides whether to add b to a or subtract b from a
;; based on whether or not b is greater than 0. as a consequence, it
;; adds the absolute value of b to a.
