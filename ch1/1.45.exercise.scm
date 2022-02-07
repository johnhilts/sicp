;; fixed-point defined 1.36
;; average-damp defined 1.40
;; repeated defined 1.43

;; I defined average elsewhere to take 3 args, so redefining it again here
(define (average a b) (/ (+ a b) 2))

(define (get-root-on-repeat x power)
  (let ((count (cond
                ((< power 4)
                 1)
                ((< power 7)
                 2)
                (else 3))))
    (fixed-point ((repeated average-damp count)
                  (lambda (y) (/ x (expt y (- power 1)))))
                 1.0)))
