#lang sicp
; ついでにBenは謎めいたことをいった: 「区間の端点の符号を調べると, mul-intervalを九つの場合に分けることが出来, そのうち一つだけが二回を超える乗算を必要とする.」 Benの提案に従い, 手続きを書き直せ.
(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; alyssaの例
(define (alyssa-mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; 9通り -> xとyにおいて、3通り（(+ +) (- +) (- -) ） の符号の組み合わせがあるので、3*3で9通り
;   xl xu yl yu
; 1 +  +  +  +
; 2 +  +  -  +
; 3 +  +  -  -
; 4 -  +  +  +
; 5 -  +  -  +
; 6 -  +  -  -
; 7 -  -  +  +
; 8 -  -  -  +
; 9 -  -  -  -

; 0をまたがるやつが怪しそうなので、5番が怪しい
