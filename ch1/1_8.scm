;;; Кубический корень по методу Ньютона

(define (cbrt-iter old-guess guess x)
        (if (good-enough? old-guess guess)
        guess
        (cbrt-iter guess (improve guess x) x)
        )
)

(define (improve guess x)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (good-enough? old-guess guess)
        (< (abs (- old-guess guess)) 0.000000000001)
)

(define (cbrt x)
        (cbrt-iter 0 1.0  x)
)

(cbrt 72)