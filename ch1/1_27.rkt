#!/usr/bin/env racket
#lang sicp

(define (expmod base exp m)
        (cond 
            ((= exp 0) 1)
            ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
            (else (remainder (* base (expmod base (- exp 1) m)) m))
        )
)
(define (square x)
        (* x x)
)

(define (ferma-test n a)
        (= (expmod a n n) a)
)
(define (full-ferma-test n)
        (define value (full-ferma-test-iterate n 2))
        (if (= n value)
            (print-simple n)
            (print-not-simple n)
        )
)

(define (print-simple x)
        (newline)
        (display "Число простое: ")
        (display x)
        (newline)
)

(define (print-not-simple x)
        (newline)
        (display "Число не простое: ")
        (display x)
        (newline)
)


(define (full-ferma-test-iterate n a)
        (if (< a n)
            (if (ferma-test n a)
                (full-ferma-test-iterate n (+ a 1))
                a
            )
            n
        )
)

(full-ferma-test 561)
(full-ferma-test 1105)
(full-ferma-test 1729)
(full-ferma-test 2465)
(full-ferma-test 2821)
(full-ferma-test 6601)
(full-ferma-test 19999)