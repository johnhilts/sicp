;; ((compose square inc) 6)
;; ((repeated square 2) 5)
(define (repeated f n)
  (cond
   ((= n 1)
    (lambda (x)
      (f x)))
   (else (compose ;; remember, compose just takes 2 functions, that's it!
          f
          (repeated f (- n 1))))))

;; ((repeated square 2) 5)
;; => 625
