(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square n)
  (* n n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond
   ((fast-prime? n 1)
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
