#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(* 8 (pi-sum 1 1000))


(define (plus4 x) (+ x 4))
(plus4 5)
; ↑↓は等価
(define plus4-use-lambda (lambda (x) (+ x 4)))
(plus4-use-lambda 5)