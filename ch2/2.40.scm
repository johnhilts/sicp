;;;; 2.40

(define (enumerate-interval low high)
"enumerates from low to high, inclusive. Expects integer input."
  (if (> low high)
      ()
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high))))


;;; Define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i,j) with 1 <= j < i <=n
;;;; Example: n = 6 => (i,j) => (((3, 2)), ((4, 2) (4, 3)) ((5, 2) (5, 3) (5, 4)))
;;;; thinking: j => 2 -> i, i => 3 -> n 
(define (unique-pairs n)
  (map
   (lambda (i)
     (map
      (lambda (j)
	(list i j))
      (enumerate-interval 2 (- i 1))))
   (enumerate-interval 3 n)))

;;; Use unique-pairs to simplify the definition of prime-sum-pairs given above.

;;; all these are from the sicp text: accumulate, flatmap, prime-sum?, make-pair-sum, prime-sum-pairs-original

;;; code introduced in the nested mappings section; adding here to play with
(define (sicp-remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)				; empty set?
      (list ())				; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) 
                        (cons x p))
                      (permutations 
                       (sicp-remove x s))))
               s)))

;;; these in particular are needed for 2.40
(define (next n)
  (cond
   ((= 2 n)
    3)
   (else (+ 2 n))))

(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define (prime-sum-pairs-original n)
  (map make-pair-sum
       (filter 
        prime-sum?
        (flatmap
         (lambda (i)
           (map (lambda (j) 
                  (list i j))
                (enumerate-interval 
                 1 
                 (- i 1))))
         (enumerate-interval 1 n)))))

;; example: (prime-sum-pairs-original 6)
;; => ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))

(define (prime-sum-pairs-with-unique-pairs-1st-attempt n)
  (map make-pair-sum
       (filter 
        prime-sum?
        (map car (unique-pairs n)))))

(define (prime-sum-pairs-with-unique-pairs n)
  (map make-pair-sum
       (flatmap
        prime-sum?
        (unique-pairs n))))

;; example: (prime-sum-pairs-original 6)
;; => ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))
