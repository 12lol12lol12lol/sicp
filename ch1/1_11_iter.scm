(define (func n)
        (cond ((< n 3) n)
        (else (func-iter 0 1 2 3 n)))
)

(define (func-iter arg1 arg2 arg3 counter value)
        (cond ((= counter value) (+ arg1 arg2 arg3))
        (else (func-iter arg2 arg3 (+ arg1 arg2 arg3) (+ counter 1) value)))
)

(func 50)