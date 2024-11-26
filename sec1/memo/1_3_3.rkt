#lang sicp

; --------- 区間二分法による方程式の零点の探索 ---------


(define (average a b) (/ (+ a b) 2))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

; neg-point: 負の点
; pos-point: 正の点
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point))) ; midpoint: 平均点
    (if (close-enough? neg-point pos-point) ; 2点の差が十分小さいか
        midpoint ; 小さい場合は中点を返す
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint)) ; test-value > 0 （正の値）の場合、 midpointをpos-pointへ
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (test-method x) (* x 3))
(search test-method -1.0 5.0)
; -> 0.0001220703125


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(half-interval-method sin 2.0 4.0)
; -> 3.14111328125

; (half-interval-method test-method 2.0 4.0)
; ->  Values are not of opposite sign 2.0 4.0

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)
; -> 1.89306640625

; --------- 関数の不動点の探索 --------- 
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)
; -> 0.7390822985224023

(define (sqrt-loop x)
  (fixed-point (lambda (y) (/ x y))
               1.0))
; (sqrt-loop 2)
; -> 終わらない


(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 2)
; -> 1.4142135623746899
















