; Итеративное возведение в степень за log(n)
(define (expt b n)
    (expt-iter b n 1)
)

(define (expt-iter b n a)
        (cond ((< n 2) (* b a))
            ((even? n) (expt-iter (square b) (/ n 2) a))
            (else (expt-iter (square b) (/ (- n 1) 2) (* a b)))
        )
)

(define (square x)
        (* x x)
)

(define (even? n)
        (= (remainder n 2) 0)
)

(expt 2 11)