(ns sicp.ch01)

(defn two-of-three [x y z]
  (let [sum-of-squares (fn [x y] (+ (* x x) (* y y)))]
    (cond (<= x y z) (sum-of-squares y z)
          (<= y x z) (sum-of-squares x z)
          (<= z x y) (sum-of-squares x y))))

;; Without let+fn
(defn two-of-three-v2 [x y z]
  (cond (<= x y z) (+ (* y y) (* z z))
        (<= y x z) (+ (* x x) (* z z))
        (<= z x y) (+ (* x x) (* y y))))
