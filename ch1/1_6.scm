;;; С new-if программа уйдет в бесконечную рекурсию так как 
;;; Scheme ЯП c апликативным порядком вычисления, а так как
;;; new-if функция то вычисление аргумента (sqrt-iter (improve guess x) x)
;;; уйдет в бесконечную рекурсию

(define (sqrt-iter guess x)
        (new-if (good-enough? guess x)
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


(define (new-if predicate then-clause else-clause)
        (cond (predicate then-clause)
              (else else-clause)
        )
)


(sqrt 9)