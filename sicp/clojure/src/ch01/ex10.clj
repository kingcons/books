(ns sicp.ch01)

(defn ack [x y]
  (cond (zero? y) 0
        (zero? x) (* 2 y)
        (= y 1) 2
        :else (ack (dec x)
                   (ack x (dec y)))))

;; Given the above definition of ack,
;; (ack 0 n) == 2n
;; (ack 1 n) == 2^n
;; (ack 2 n) == 2^(ack (n-1)) for n > 1, 2 otherwise
