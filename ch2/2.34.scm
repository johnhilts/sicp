(define (horner-eval x coefficient-sequence)
  (sicp-accumulate
   (lambda (this-coeff higher-terms)
     (+ (* higher-terms x) this-coeff))
   0
   coefficient-sequence))

;; compute 1+3x+5x3+x5  at x=2
;; (horner-eval 2 (list 1 3 0 5 0 1))
;; => 79

;; (horner-eval 2 (list 2 3 0 5 0 1))
;; => 80

;; (horner-eval 2 (list 2 3 0 5 0 2))
;; => 112
