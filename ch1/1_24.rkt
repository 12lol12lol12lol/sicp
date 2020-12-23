#!/usr/bin/env racket
#lang sicp
(define (expmod base exp m)
        (cond 
            ((= exp 0) 1)
            ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
            (else (remainder (* base (expmod base (- exp 1) m)) m))
        )
)

(define (square n)
        (* n n)
)

(define (ferma-test n)
        (define (try-it a)
                (= (expmod a n n) a)
        )
        (try-it (+ 1 (random 4294967087)))
)

(define (fast-prime? n times)
        (cond 
            ((= times 0) true)
            ((ferma-test n) (fast-prime? n (- times 1)))
            (else false)
        )
)


(define (report-prime elapsed-time n)
        (newline)
        (display n)
        (display " *** ")
        (display elapsed-time)
)

(define (search-for-primes start primes-count)
        (define start-time (runtime))
        (if (> primes-count 0)
            (cond ((fast-prime? start 1) 
                   (report-prime (- (runtime) start-time) start)
                   (search-for-primes (+ start 1) (- primes-count 1))
                  )
                    (else (search-for-primes (+ start 1) primes-count)))
        )
)

(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)
; При использовании теста Ферма время вычисления сократилось в разы в сравнении с 1_23_1.rkt
; log(100000000000)/log(10000000000) = 1.09999
; время вычисления ссответсвенно 14 и 12. 14/12 = 1.1666.
; из этого модем сделать вывод что скоро роста нашего алгоритма log(n)*log(C) или log(n)*C