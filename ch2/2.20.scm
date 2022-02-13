(define (same-parity x . y)
  (let ((parity (remainder x 2)))
    (define (same-parity-r y)
      (if (null? y)
          ()
          (if (= parity (remainder (car y) 2))
              (append (list (car y)) (same-parity-r (cdr y)))
              (same-parity-r (cdr y)))))
    (same-parity-r y)))

;; (same-parity 1 2 3 4 5 6 7)
;; => (1 3 5 7)

;; (same-parity 2 3 4 5 6 7)
;; => (2 4 6)