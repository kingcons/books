(ns sicp.ch01)

(defn + [a b]
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(defn + [a b]
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

;; The first procedure above produces a recursive process while the
;; second produces an iterative process.
