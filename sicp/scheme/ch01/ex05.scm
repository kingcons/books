;; (define (p) (p))

;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y))

;; (test 0 (p))

;; Ben Bitdiddle expects this test to inform him whether he is using
;; a language with applicative order evaluation like Scheme or one
;; with normal order (lazy) evaluation.

;; In the case of a normal order language, (test 0 (p)) would return
;; 0 and terminate. In the case of an applicative language, the
;; example will recurse infinitely as it tries to evaluate (p).

