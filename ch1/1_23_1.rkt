#!/usr/bin/env racket
#lang sicp
(define (prime? n)
        (cond ((< n 4) true)
            ((divides? n 2) false)
            (else (= (smaller-divisior n) n))
        )
)

(define (smaller-divisior n)
        (smaller-divisior-iter 3 n)
)

(define (smaller-divisior-iter divisior n)
        (cond ((> (* divisior divisior) n) n)
            ((divides? n divisior) divisior)
            (else (smaller-divisior-iter (+ divisior 2) n))
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
; Попробовал оптимизировать алгоритм из 1_23.rkt. Ускорение не существенное на маллых величинах.
; но с ростом чисел оно становиться более существенным