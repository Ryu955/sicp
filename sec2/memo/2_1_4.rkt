#lang sicp

; 二つの区間を足す手続き
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; 限界の積の最大値と最小値を見つけ, それらを結果の区間の限界とすることで, 二つの区間の積も作った. (minとmaxは任意個の引数の最小値と最大値を見つける基本手続きである.)
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(min 1 2 3)
; -> 1
(max 1 2 3)
; -> 3

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


(define (make-interval a b) (cons a b))

; -- upper と lower を実装 --
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; -- 動作確認 --

(define interval1 (make-interval 6.12 7.48))
(define interval2 (make-interval 4.465 4.935))

(upper-bound interval1)
; -> 6.12
(lower-bound interval1)
; -> 7.48

(define sum-interval (add-interval interval1 interval2))
(upper-bound sum-interval)
; -> 12.415
(lower-bound sum-interval)
; -> 10.585

(define product-interval (mul-interval interval1 interval2))
(upper-bound product-interval) ; -> 27.3258
(lower-bound product-interval) ; -> 36.9138

(define division-interval (div-interval interval1 interval2))
(upper-bound division-interval) ; -> 1.2401215805471126
(lower-bound division-interval) ; -> 1.6752519596864504
