(define (iterative-improve good-enough? improve-guess)
  (lambda (guess x)
    (if (good-enough? guess x)
        guess
        ((iterative-improve good-enough? improve-guess) (improve-guess guess x) x))))

(define (sqrt-existing-way x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (improve guess x)
  "from 1.1.7"
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter-imp x)
  ((iterative-improve good-enough? improve) 1 x))

;; defined in 1.1.7; copying to here for convenience
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
