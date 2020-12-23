; Итеративное перемножение чисел
(define (mul a b)
        (if (> b a)
            (mul-iter b a 0)
            (mul-iter a b 0)
        )
)

(define (mul-iter a b add)
        (cond ((< b 2) (+ a add))
            ((even? b) (mul-iter (double a) (halve b) add))
            (else (mul-iter (double a) (halve (- b 1)) (+ add a)))
        )
)