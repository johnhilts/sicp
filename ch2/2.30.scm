;;  (square-tree
;;  (list 1
;;       (list 2 (list 3 4) 5)
;;       (list 6 7)))
;; => (1 (4 (9 16) 25) (36 49))

(define (square-tree-with-recursion tree)
  "Squares all numbers in a tree while preserving the tree's structure."
  (cond
   ((null? tree) ())
   ((not (pair? tree))
    (* tree tree))
   (else
    (cons (square-tree-with-recursion (car tree)) (square-tree-with-recursion (cdr tree))))))

(define (square-tree-with-map tree)
  "Squares all numbers in a tree while preserving the tree's structure."
  (sicp-map
   (lambda (sub-tree)
     (if  (pair? sub-tree)
          (square-tree-with-map sub-tree)
          (* sub-tree sub-tree)))
   tree))
