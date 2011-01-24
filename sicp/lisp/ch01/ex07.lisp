(in-package :sicp)

(defun good-enough-p (guess x)
  (< (abs (- (improve guess x) guess))
     (* .000001 guess)))
