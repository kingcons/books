(in-package :sicp)

(defun improve (guess x)
  (/ (+ (* 2 guess) (/ x (expt guess 2)))
     3))

(defun cube-iter (guess x)
  (if (good-enough-p guess x)
      guess
      (cube-iter (improve guess x) x)))

(defun good-enough-p (guess x)
  (< (abs (- (improve guess x) guess))
     (* .000001 guess)))

(defun cube-root (x)
  (cube-iter 1.0 x))

;; Now exhibiting lexical/block structure
;; 1 Global function vs 5 above
(defun cube-root-v2 (x)
  (labels ((improve (guess x)
             (/ (+ (* 2 guess) (/ x (expt guess 2)))
                3))
           (cube-iter (guess x)
             (if (good-enough-p guess x)
                 guess
                 (cube-iter (improve guess x) x)))
           (good-enough-p (guess x)
             (< (abs (- (improve guess x) guess))
                (* .000001 guess))))
    (cube-iter 1.0 x)))

;; Now lispier...but would a good lisper really use labels here?
(defun cube-root-v3 (x)
  (labels ((improve (guess x)
             (/ (+ (* 2 guess) (/ x (expt guess 2)))
                3))
           (good-enough-p (guess x)
             (< (abs (- (improve guess x) guess))
                (* .000001 guess))))
    (let ((guess 1.0))
      (loop until (good-enough-p guess x) do
           (setf guess (improve guess x)))
      guess)))
