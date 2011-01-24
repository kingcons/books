;;This one actually gave me some trouble for a bit because I wanted to solve the problem in a non-standard way. After a while, I cracked and read the precursor text (but not the code) to Eli Bendersky’s solution and noticing that he defined the function with two arguments (for columns and rows) arrived fairly quickly with that insight at what seems to be the more or less standard solution. I had this much completed for a week or more but got stalled trying to figure out the problem of a pascal function that takes one argument. That diversion contributed greatly to the delay in my progress. I did solve it though and posted the results separately. Here’s the standard solution:

(define (pas row col)
  (cond ((= row 1) 1)
	((= col 1) 1)
	((= row col) 1)
	(else (+ (pas (- row 1) (- col 1))
		 (pas (- row 1) col)))))
;Value: pas

