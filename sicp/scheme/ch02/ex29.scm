;; part a.
(define (left-branch mobile)
  (car mobile))
;Value: left-branch

(define (right-branch mobile)
  (cdr mobile))
;Value: right-branch

(define (branch-length branch)
  (car branch))
;Value: branch-length

(define (branch-structure branch)
  (cdr branch))
;Value: branch-structure

;;part b.
(define (total-weight mobile)
  (cond ((null? mobile) 0)
	((not (pair? mobile)) (branch-structure mobile))
	(else (+ (total-weight (car mobile))
		 (total-weight (cdr mobile))))))
;Value: total-weight

(define x (list (list 2 2) (list 2 2)))
;Value: x

(total-weight x)

;;c.
(define (is-balanced? mobile)
  (define (torque branch)
    (* (branch-length branch)
       (branch-structure branch)))
  (= (torque (left-branch mobile))
     (torque (right-branch mobile))))
;Value: is-balanced?

(is-balanced? x)

;;d.



NEEDS WORK!!!