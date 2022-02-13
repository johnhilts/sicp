(define (sicp-reverse l)
  (if (null? l)
      ()
      (append (sicp-reverse (cdr l)) (list (car l)))))

;; (sicp-reverse (list 1 4 9 16 25))
;; => (25 16 9 4 1)
