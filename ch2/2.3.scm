(define (make-length-width length width)
  (cons length width))

(define (make-rectangle origin-point length-width)
  (cons origin-point length-width))

(define (rectangle-origin-point rectangle)
  (cons rectangle))

(define (rectangle-length rectangle)
  (car (cdr rectangle)))

(define (rectangle-width rectangle)
  (cdr (cdr rectangle)))

(define (rectangle-area rectangle)
  (*
   (rectangle-length rectangle)
   (rectangle-width rectangle)))

(define (rectangle-perimeter rectangle)
  (+
   (* 2 (rectangle-length))
   (* 2 (rectangle-width))))
