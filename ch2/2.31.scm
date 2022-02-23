(define (tree-map proc tree)
  "General-purpose tree mapping function."
  (sicp-map
   (lambda (sub-tree)
     (if  (pair? sub-tree)
          (tree-map sub-tree)
          (proc sub-tree)))
   tree))

;;; The below should work
(define (square-it item) (* item item))

(define (square-tree-generalized tree)
  (tree-map square tree))

