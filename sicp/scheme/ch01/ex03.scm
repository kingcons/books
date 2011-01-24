(define (two-of-three x y z)
  (let ((sum-of-squares (lambda (x y)
                          (+ (* x x) (* y y)))))
    (cond ((<= x y z) (sum-of-squares y z))
          ((<= y x z) (sum-of-squares x z))
          ((<= z x y) (sum-of-squares x y)))))

;; Without let+lambda
(define (two-of-three-v2 x y z)
  (cond ((<= x y z) (+ (* y y) (* z z)))
        ((<= y x z) (+ (* x x) (* z z)))
        ((<= z x y) (+ (* x x) (* y y)))))
