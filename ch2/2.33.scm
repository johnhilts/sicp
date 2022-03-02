(define (sicp-filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate
                       (cdr sequence))))
        (else  (filter predicate
                       (cdr sequence)))))

(define (sicp-accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (sicp-accumulate op
                      initial
                      (cdr sequence)))))

(define (map-using-accumulate p sequence)
  "As-is from the book, but x is cur and y is acc."
  (sicp-accumulate
   (lambda (x y) (cons (p x) y))
   ()
   sequence))

(define (append-using-accumulate seq1 seq2)
  (sicp-accumulate cons seq2 seq1))

(define (sicp-length sequence)
  (sicp-accumulate (lambda (cur acc) (1+ acc)) 0 sequence))
