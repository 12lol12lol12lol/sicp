(define (square a)
        (* a a)
)

(define (sum-of-squares a b)
        (+ (square a) (square b))
)

(define (sum-of-two-greatest a b c)
        (cond ((<= (min a b) c) (sum-of-squares c (max a b)))
              ((> (min a b) c) (sum-of-squares a b))
        )
)
(sum-of-two-greatest 2 2 1)