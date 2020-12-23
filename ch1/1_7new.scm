(define counter 0)
(define (sqrt-iter old-guess guess x)
        (set! counter (+ counter 1))
        (if (good-enough? old-guess guess)
        guess
        (sqrt-iter guess (improve guess x) x)
        )
)

(define (improve guess x)
        (average guess (/ x guess))
)

(define (average x y)
        (/ (+ x y) 2)
)

(define (good-enough? old-guess guess)
        (< (abs (- guess old-guess)) 0.001)
)

(define (sqrt x)
        (sqrt-iter 0 1.0  x)
)

(sqrt 100000000000000000)
(newline)
(display counter)
(newline)


;;; (sqrt 100000000);Value: 10000. counter 19
;;; (sqrt 100000000000) ;Value: 316227.7660168379 Counter:24
;;; (sqrt 100000000000000) ;Value: 10000000. Counter: 29
;;; (sqrt 100000000000000000) ;Value: 316227766.01683795 Counter: 35
;;; (sqrt 100000000000000000) Counter: 33