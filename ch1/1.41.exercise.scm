(define (inc n)
  (+ 1 n))

(define (double 1-arg-proc)
  (lambda (x)
    (1-arg-proc (1-arg-proc x))))

;; ((double inc) 1)
;; => 3

;; (((double (double double)) inc) 5)
;; => 21

