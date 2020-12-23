(define (mul a b)
        (cond ((< b 2) a)
            ((> b a) (mul b a))
            ((even? b) (mul (double a) (halve b)))
            (else (+ a (mul (double a) (halve (- b 1)))))
            )
)