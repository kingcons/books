;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-clause)
;;         (else else-clause)))

;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x)
;;                      x)))

;; Given a new-if procedure as above, attempts to compute sqrt-iter
;; will never terminate due to the applicative-order evaluation
;; semantics of scheme. The else clause in new-if will always be
;; computed leading to runaway recursive calls to sqrt-iter.
