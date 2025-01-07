#lang sicp




(define (iterative-improve good-enough? improve first-guess x)
  (define (iter guess x)
    (if (good-enough? guess x)
        guess
        (iter (improve guess x) x)))
  (iter first-guess x)
  )
(iterative-improve good-enough? improve 1.0 9)
; -> 3.00009155413138

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

(iterative-improve close-enough? cos 1.0 9)