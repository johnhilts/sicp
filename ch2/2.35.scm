(define (sicp-count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (sicp-count-leaves (car x))
                 (sicp-count-leaves (cdr x))))))

;; (define leaf-list (cons (list 1 2) (list 3 4)))
;; => ((1 2) 3 4)
;; (sicp-length leaf-list)
;; => 3
;; (sicp-count-leaves leaf-list)
;; => 4

(define (count-leaves-with-accumulate t)
  (sicp-accumulate
   +
   0
   (map-using-accumulate
    (lambda (item)
      (cond
       ((pair? item)
        (count-leaves-with-accumulate item))
       (else 1)))
    t)))
