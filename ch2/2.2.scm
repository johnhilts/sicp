"Consider the problem of representing line segments in a plane. Each
segment is represented as a pair of points: a starting point and an
ending point. Define a constructor make-segment and selectors
start-segment and end-segment that define the representation of
segments in terms of points. Furthermore, a point can be represented
as a pair of numbers: the xx coordinate and the yy
coordinate. Accordingly, specify a constructor make-point and
selectors x-point and y-point that define this
representation. Finally, using your selectors and constructors, define
a procedure midpoint-segment that takes a line segment as argument and
returns its midpoint (the point whose coordinates are the average of
the coordinates of the endpoints). To try your procedures, you’ll need
a way to print points:"

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-point x y)
  "make a point given the x y coordinates"
  (cons x y))

(define (make-segment start-segment end-segment)
  "Given starting and ending segments, define the representation of
segments in terms of points."
  (cons start-segment end-segment))

(define (midpoint-segment line-segment)
  "given a line segment as argument, return its midpoint.  midpoint:
the point whose coordinates are the average of the coordinates of the
endpoints."
  (make-point
   (/ (+ (x-point (car line-segment)) (x-point (cdr line-segment))) 2)
   (/ (+ (y-point (car line-segment)) (y-point (cdr line-segment))) 2)))

(define (print-point p)
  "print points"
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  p)
