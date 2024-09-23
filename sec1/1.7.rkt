#lang sicp
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))


(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square a) (* a a))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; (sqrt 0.00000000000000000000000000000000000000009)
; (sqrt 900000000000000000000000000000000000000000000000000000)

(define (good-enough-v2? guess prev-guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.001))

(define (sqrt-iter-v2 guess prev-guess x)
  (if (good-enough-v2? guess prev-guess)
      guess
      (sqrt-iter-v2 (improve guess x) guess x)))


(define (sqrt-v2 x)
  (sqrt-iter-v2 1.0 0.0 x))

(sqrt-v2 900000000000000000000000000000000000000000000000000000)
(sqrt-v2 0.00000000000000000000000000000000000000009)

(sqrt-v2 9)
; 本体を取り出す
(sqrt-iter-v2 1.0 0.0 9)
; 本体を取り出す
(if (good-enough-v2? 1.0 0.0)
    1.0
    (sqrt-iter-v2 (improve 1.0 9) 1.0 9))
; ifのpredicateを評価
(good-enough-v2? 1.0 0.0)
; 本体を取り出す
(< (abs (/ (- 1.0 0.0) 1.0)) 0.001)
; 部分式を評価
(< (abs (/ -1.0 1.0)) 0.001)
(< (abs -1.0) 0.001)
(< 1.0 0.001)
; -> #f
; predicate -> #f なので、alternativeを評価する
(sqrt-iter-v2 (improve 1.0 9) 1.0 9)
; (improve 1.0 9) -> 5.0だったので省略
(sqrt-iter-v2 5.0 1.0 9)
; 本体を取り出す
(if (good-enough-v2? 5.0 1.0)
    5.0
    (sqrt-iter-v2 (improve 5.0 9) 5.0 9))
; predicateを評価
(good-enough-v2? 5.0 1.0)
; 本体を取り出す
(< (abs (/ (- 5.0 1.0) 5.0)) 0.001)
; 部分式を評価
(< (abs -0.8) 0.001)
(< 0.8 0.001)
; -> #f

; #tがでるところ
(good-enough-v2? 3.000 3.002)
(< (abs (/ (- 3.000 3.0002) 3.000)) 0.001)
; 部分式を評価（- 3.000 3.0002）は、実際は誤差が出ていた
(< (abs (/ -0.0002 3.000)) 0.001)
(< (abs (-0.00006667) 0.001))
(< 0.00006667 0.001)
; -> #t
   











