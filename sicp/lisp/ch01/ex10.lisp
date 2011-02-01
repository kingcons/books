(in-package :sicp)

(defun ack (x y)
  (cond ((zerop y) 0)
        ((zerop x) (* 2 y))
        ((= y 1) 2)
        (t (ack (1- x)
                (ack x (1- y))))))

;; Given the above definition of ack,
;; (ack 0 n) == 2n
;; (ack 1 n) == 2^n
;; (ack 2 n) == 2^(ack (n-1)) for n > 1, 2 otherwise
