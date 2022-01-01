(define (get-first-n-odds-iter n x i)
  "iterator"
  (cond
   ((> x n)
    (display "First ")
    (display n)
    (display " odds found!")
    (newline)
    'Done!)
   ((not (= 0 (remainder i 2)))
    (display i)
    (display " is odd!")
    (newline)
    (get-first-n-odds-iter n (+ 1 x) (+ i 1)))
   (else (get-first-n-odds-iter n x (+ i 1)))))

(define (get-first-n-odds n)
  "get the first n number of odd numbers"
  (newline)
  (display "Searching for the first ")
  (display n)
  (display " odd numbers...")
  (newline)
  (get-first-n-odds-iter n 1 1))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
