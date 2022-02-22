(define (make-mobile left right)
  "A binary mobile consists of two branches, a left branch and a right
branch. Each branch is a rod of a certain length, from which hangs
either a weight or another binary mobile. We can represent a binary
mobile using compound data by constructing it from two branches"
  (list left right))

(define (make-branch length structure)
  "A branch is constructed from a length (which must be a number)
together with a structure, which may be either a number (representing
a simple weight) or another mobile"
  (list length structure))

(define (left-branch mobile)
  "Return the left branch of a mobile. 
A branch is (number [number | mobile])"
  (cond
   ((null? mobile)
    '())
   (else (car mobile))))

(define (right-branch mobile)
  "Return the right branch of a mobile.
A branch is (number [number | mobile])"
  (cond
   ((null? mobile)
    '())
   (else (cadr mobile))))

(define (branch-length branch)
  "Return the length component of a branch."
  (cond
   ((null? branch)
    0)
   (else (car branch))))

(define (branch-structure branch)
  "Return the structure component of a branch."
  (cond
   ((null? branch)
    0)
   (else (cadr branch))))

(define (total-weight mobile)
  "Return the total weight of a mobile."
  (define (total-weight-r branch)
    (cond
     ((null? branch)
      0)
     (else
      (let ((structure (branch-structure branch)))
        (cond
         ((null? structure)
          0)
         ((pair? structure)
          (+ (total-weight-r (left-branch structure)) (total-weight-r (right-branch structure))))
         (else structure))))))
  (+ (total-weight-r (left-branch mobile)) (total-weight-r (right-branch mobile))))


(define (left-branch-null? mobile)
  "Check if left branch is empty."
  (cond
   ((null? mobile)
    #t)
   ((null? (left-branch mobile))
    #t)
   (else #f)))

(define (right-branch-null? mobile)
  "Check if right branch is empty."
  (cond
   ((null? mobile)
    #t)
   ((null? (right-branch mobile))
    #t)
   (else #f)))

(define (balanced? mobile)
  "A mobile is said to be balanced if the torque applied by its
top-left branch is equal to that applied by its top-right branch (that
is, if the length of the left rod multiplied by the weight hanging
from that rod is equal to the corresponding product for the right
side) and if each of the submobiles hanging off its branches is
balanced. "
  (define (balanced-r? mobile)
    (cond
     ((null? mobile)
      #t)
     ((or (left-branch-null? mobile) (right-branch-null? mobile))
      #f)
     (else
      (let* ((branch-l (left-branch mobile))
             (branch-r (right-branch mobile))
             (length-l (branch-length branch-l))
             (length-r (branch-length branch-r))
             (structure-l (branch-structure branch-l))
             (structure-r (branch-structure branch-r))
             (has-sub-mobile-l (pair? structure-l))
             (has-sub-mobile-r (pair? structure-r))
             (weight-l (if has-sub-mobile-l (total-weight structure-l) structure-l))
             (weight-r (if has-sub-mobile-r (total-weight structure-r) structure-r))
             (torque-l (* length-l weight-l))
             (torque-r (* length-r weight-r)))
        (cond
         ((= torque-l torque-r)
          (and (if has-sub-mobile-l (balanced-r? structure-l) #t) (if has-sub-mobile-r (balanced-r? structure-r) #t)))
         (else #f))))))
  (balanced-r? mobile))

;; examples
(define 2-29-m1 (make-mobile
                 (make-branch 4 6)
                 (make-branch 5
                              (make-mobile
                               (make-branch 3 7)
                               (make-branch 9 8)))))

;; Test
(define weight-2-29 (make-mobile (make-branch 2 3) (make-branch 2 3)))
;; => (total-weight weight-2-29) ;; 6

;; Test
(define balance-2-29 (make-mobile (make-branch 10 weight-2-29) (make-branch 12 5)))
;; Looks like: ((10 ((2 3) (2 3))) (12 5))
;; => (balanced? balance-2-29) ;; #t 
