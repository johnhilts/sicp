;; (for-each
;;  (lambda (x) (newline) (display x))
;;  (list 57 321 88))
;; 57
;; 321
;; 88

(define (sicp-for-each proc l)
  (cond
   ((null? l)
    'done)
   (else
    (proc (car l))
    (sicp-for-each proc (cdr l)))))
