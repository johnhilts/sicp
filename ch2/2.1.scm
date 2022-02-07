(define (make-rat n d)
  "Exercise 2.1: Define a better version of make-rat that handles both
positive and negative arguments. Make-rat should normalize the sign so
that if the rational number is positive, both the numerator and
denominator are positive, and if the rational number is negative, only
the numerator is negative."
  (cond
   ((or (and (> n 0) (> d 0)) (and (< n 0) (< d 0)))
    (cons (abs n) (abs d)))
   ((< n 0) (cons n d))
   ((< d 0) (cons (- n) (abs d)))))
