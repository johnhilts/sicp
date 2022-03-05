(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (sicp-accumulate op init (sicp-map car seqs))
            (accumulate-n op init (sicp-map cdr seqs)))))

;; (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
