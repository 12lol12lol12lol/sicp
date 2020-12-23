(define counter 0)
(define (sqrt-iter guess x)
        (set! counter (+ counter 1))
        (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
        )
)

(define (improve guess x)
        (average guess (/ x guess))
)

(define (average x y)
        (/ (+ x y) 2)
)

(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt x)
        (sqrt-iter 1.0  x)
)

(sqrt 100000000000000000)
(newline)
(display counter)
(newline)


;;; (sqrt 100000000) ;Value: 10000. Counter: 19
;;; (sqrt 100000000000) ;Value: 316227.7660168379 Counter
;;; (sqrt 100000000000000) ;Value: 10000000. Counter: 29
;;; (sqrt 100000000000000000) None Counter. 
;;; (sqrt 10000000000000000) Counter: 32