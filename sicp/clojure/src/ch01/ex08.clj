(ns sicp.ch01
  (:use clojure.contrib.math))

(defn improve [guess x]
  (/ (+ (* 2 guess) (/ x guess guess))
     3))

(defn good-enough? [guess x]
  (< (abs (- (improve guess x) guess))
     (* 0.000001 guess)))

(defn cube-iter [guess x]
  (if (good-enough? guess x)
    guess
    (recur (improve guess x) x)))

(defn cube-root [x]
  (cube-iter 1.0 x))

;; Now exhibiting lexical/block structure
;; 1 Global function vs 5 above
(defn cube-root-v2 [x]
  (let [improve (fn [guess x]
                  (/ (+ (* 2 guess) (/ x guess guess))
                     3))
        good-enough? (fn [guess x]
                       (< (abs (- (improve guess x) guess))
                          (* 0.000001 guess)))
        ; note that we have to be explicit about the
        ; fn name here to enable it to recurse
        cube-iter (fn cube-iter [guess x]
                    (if (good-enough? guess x)
                      guess
                      (recur (improve guess x) x)))]
    (cube-iter 1.0 x)))
