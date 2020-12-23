#!/usr/bin/env racket
#lang sicp
(define (prime? n)
        (= (smaller-divisior n) n)
)

(define (smaller-divisior n)
        (smaller-divisior-iter 2 n)
)

(define (smaller-divisior-iter divisior n)
        (cond ((> (* divisior divisior) n) n)
            ((divides? n divisior) divisior)
            (else (smaller-divisior-iter (+ divisior 1) n))
            )
)

(define (divides? a b)
        (= (remainder a b) 0)
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
            (cond ((prime? start) 
                   (report-prime (- (runtime) start-time) start)
                   (search-for-primes (+ start 1) (- primes-count 1))
                  )
                    (else (search-for-primes (+ start 1) primes-count)))
        )
)

(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
; Действительно порядок роста составляет примерно 3.1 но только на больших значениях