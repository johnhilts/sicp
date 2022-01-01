(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  ;; (newline)
  ;; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond
   ((prime? n)
    (report-prime (- (runtime) start-time))
    #t)
   (else #f)))

(define (report-prime elapsed-time)
  (display "Found! Elapsed time: ")
  (display elapsed-time)
  (newline))

(define (get-first-n-primes-over-k-iter n k x i)
  "iterator"
  (cond
   ((> x n)
    (display "First ")
    (display n)
    (display " prime numbers found")
    (display " over ")
    (display k)
    (display "!")
    (newline)
    'Done!)
   ((not (= 0 (remainder i 2)))
    (newline)
    (display "Checking " )
    (display i)
    (display " ... ")
    (if (timed-prime-test i)
        (get-first-n-primes-over-k-iter n k (+ 1 x) (+ i 2))
        (get-first-n-primes-over-k-iter n k x (+ i 2))))
   (else (get-first-n-primes-over-k-iter n k x (+ i 1)))))

(define (get-first-n-primes-over-k n k)
  "get the first n prime numbers over k"
  (newline)
  (display "Searching for the first ")
  (display n)
  (display " prime numbers over ")
  (display k)
  (display "...")
  (newline)
  (get-first-n-primes-over-k-iter n k 1 (+ 1 k)))

(define (search-for-primes-iter lst)
  (cond
   ((null? lst)
    'Done)
   (else
    (get-first-n-primes-over-k 3 (car lst))
    (search-for-primes-iter (cdr lst)))))

(define (search-for-primes)
  (let ((lst (list (expt 10 3) (expt 10 4) (expt 10 5) (expt 10 6))))
    (search-for-primes-iter lst)))

(define (search-for-primes-modern)
  (let ((lst (list (expt 10 9) (expt 10 10) (expt 10 11) (expt 10 12))))
    (search-for-primes-iter lst)))
