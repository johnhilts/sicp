(define (cons-sicp x y)
  (lambda (m) (m x y)))

(define (car-sicp z)
  (z (lambda (p q) p)))

(define (cdr-sicp z)
  (z (lambda (p q) q)))
