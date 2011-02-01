(define x (list 1 3 (list 5 7) 9))
;Value: x

(cdr (car (cdr (cdr x))))
;Value 12: (7)

(define y (list (list 7)))
;Value: y

(car (car y))
;Value: 7

(define z (list 1
		(list 2
		      (list 3
			    (list 4 
				  (list 5 
					(list 6 7)))))))
;Value: z

(cdr
 (car
  (cdr
   (car
    (cdr
     (car
      (cdr
       (car
	(cdr
	 (car
	  (cdr z)))))))))))
;Value 24: (7)

;;Alternate representations:
(cdr (cadr (cadr (cadr (cadr (cadr z))))))
(cdadr (cadr (cadr (cadr (cadr z)))))

;;I'm somewhat surprised by this last example. I figured six cdrs would do the job. It turns out I was grossly mistaken. It takes 11 calls to do the job of traversing the list structure. Repeated cdrs only give you '()s.



