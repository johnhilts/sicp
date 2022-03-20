(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (sicp-accumulate op initial sequence))

(define (reverse-right sequence)
  (fold-right
   (lambda (acc cur) (append cur (list acc))) () sequence))

(define (reverse-left sequence)
  (fold-left
   (lambda (acc cur) (cons cur acc)) () sequence))
