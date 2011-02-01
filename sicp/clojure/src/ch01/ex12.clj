(ns sicp.ch01)

(defn pascal (row column)
  (if (or (= row 1)
          (= column 1)
          (= row column))
    1
    (+ (pascal (dec row) (dec column))
       (pascal (dec row) column))))
