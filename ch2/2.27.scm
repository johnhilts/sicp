(define (deep-reverse l)
  (cond
   ((null? l)
    '())
   ((not (pair? l))
    (list l))
   (else
    (append (deep-reverse (cdr l)) (if (pair? (car l)) (list (deep-reverse (car l))) (deep-reverse (car l)))))))
;; (define x (list (list 1 2) (list 3 4)))
;; (deep-reverse x)
;; => ((4 3) (2 1))
