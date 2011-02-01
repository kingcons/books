(define zero (lambda (f) (lambda (x) x)))
;Value: zero

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;Value: add-1

(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f x))) ;; this was the difficult step for me. why? i couldn't understand how ((zero f) x) got worked down to x. I knew that the identity function was what eventually got returned but I figured it received f as it's argument. The trick was recalling that f gets passed into a function which does NOTHING WITH F and returns the identity function anyway. (zero f) reduces to the identity function because of the first lambda in zero that just throws it's argument away. Hence, you have (identity x) which is just x and leaves this result as one. somewhat sadly, formatting my code so that the substitution wasn't all on one line also could've made the difference and saved me a week or so.

(define one (lambda (f) (lambda (x) (f x))))
;Value: one

(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x))));; again the f arg is thrown away and x is put into the second lambda to give...
(lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))
;Value: two

;;clearly we're adding an application of f each time we add one. for example...
((two square) 5)
;Value: 625
;; which is the square of the square of 5 (* 25 25)

;;now i'm supposed to define an addition function which should perform like so:
(add one two)
(add (lambda (f) (lambda (x) (f x)))
     (lambda (f) (lambda (x) (f (f x)))))
...
(lambda (f) (lambda (x) (f (f (f x)))))
;;and then allow us to do this
(((add one two) square) 5)
(square (square (square 5)))
;Value: 390625

;;maybe the hard part of this problem is holding multiple levels of evaluation in your head at the same time. anyway...
;;it seems like what we really want to do is feed the f chains into each other somehow...p

(define (add a b)
  (lambda (f) (lambda (x) ((a f) (b f)) x)))
;Value: add

;;this is tempting but wrong. i realized you had to pass the f in to make sure you got the correct repeated calls but missed that if you passed (b f) into the resulting function you were passing a procedure instead of a value.

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
;Value: add

(add one two)
(lambda (f) (lambda (x) ((one f) ((two f) x))))
(lambda (f) (lambda (x) ((one f)
			 ((lambda (x) (f (f x))) x))))
(lambda (f) (lambda (x)
	      (lambda (x) ((f x)
			   (lambda (x) (f (f x)) x)))
(lambda (f) (lambda (x) (f (f (f x)))))

;;you want to hear what's really gross? i found that this worked for odd numbers but not even numbers and tried unsuccessfully to figure out what was wrong for an hour before re-evaluating my definitions for one and two and seeing it "just work".

(((add one two) square) 5)

(define (test churchnum)
  (define (inc x)
    (+ x 1))
  ((churchnum inc) 0))
;Value: test

(test (add one two))
;Value: 3

;;it's sort of insulting that after writing all that code you realize 
you just implemented a fancy lambda version of repeated for 
functions/church numerals.

;;proving above point:
(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
;Value: repeated

(define (add a b)
  (lambda (f) (repeated f (+ a b))))
;Value: add

;;of course, this pretends that church numerals are integers but...you get the idea.
