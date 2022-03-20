;;;; Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than or equal to a given integer n that sum to a given integer s.
;;;; n = 11, s = 20 => ((4, 6, 10) (3, 7, 10) (2, 8, 10) (1, 9, 10) (2, 9, 9)) probably more

;; unique-pairs |> map |> range |> map formula
(define (get-ordered-triples n s)
  (map
   (lambda (unique-pair)
     (let ((j (car unique-pair))
           (k (cadr unique-pair)))
       (filter
        (lambda (item) (and (not (pair? item)) (not (null? item))))
        (map
         (lambda (i)
           (if (= s (+ i j k))
               (list i j k)
               ()))
         (enumerate-interval j n))))
     (flatmap (lambda (item) (cons (car item) (cdr item))) (unique-pairs n)))))
