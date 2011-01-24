(ns sicp.ch01)

(defn good-enough? [guess x]
  (< (abs (- (improve guess x) guess))
     (* 0.000001 guess)))
