(define (average a b c)
  "redefining average to take 3 parameters"
  (/ (+ a b c) 3))

(define (smooth f)
  "note: dx is defined elsewhere in ch1"
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

;; ((smooth (lambda (x) (* x 2))) 3)
;; => 6
;; ((lambda (y) ((smooth (lambda (x) (* x 2))) y)) 3)
;; => 6
;; ((repeated (lambda (y) ((smooth (lambda (x) (* x 2))) y)) 2) 3)
;; => 12
;; based on ansewr from internet

;; ((n-fold-smooth (lambda (x) (* x 2)) 2) 3)
;; => 6.

;; ((n-fold-smooth (lambda (x) (* x 2)) 3) 3)
;; => 6.

;; ((n-fold-smooth (lambda (x) (* x 2)) 5) 3)
;; => 6.


