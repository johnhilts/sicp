;; (square-list (list 1 2 3 4))
;; => (1 4 9 16)

(define (sicp-map proc items)
  (if (null? items)
      ()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-1 items)
  (if (null? items)
      ()
      (cons (* (car items) (car items)) (square-list-1 (cdr items)))))

(define (square-list-2 items)
    (sicp-map (lambda (e) (* e e)) items))
