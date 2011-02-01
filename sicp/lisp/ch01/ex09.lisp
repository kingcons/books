(in-package :sicp)

(defun + (a b)
  (if (= a 0)
      b
      (1+ (+ (1- a) b))))

(defun + (a b)
  (if (= a 0)
      b
      (+ (1- a) (1+ b))))

;; The first procedure above produces a recursive process while the
;; second produces an iterative process.
