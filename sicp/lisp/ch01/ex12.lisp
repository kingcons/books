(in-package :sicp)

(defun pascal (row column)
  (if (or (= row 1)
          (= column 1)
          (= row column))
      1
      (+ (pascal (1- row) (1- column))
         (pascal (1- row) column))))
