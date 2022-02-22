(define (fringe items)
  "Takes a tree (represented as a list) as an argument and returns a list whose elements are all the leaves of the tree arranged in left-to-right order."
  (cond
   ((null? items)
    '())
   ((not (pair? items))
    (list items))
   (else
    (append
     (fringe (car items))
     (fringe (cdr items))))))

;; (define x (list (list 1 2) (list 3 4)))

;; (fringe x)
;; => (1 2 3 4)

;; (fringe (list x x))
;; => (1 2 3 4 1 2 3 4)
