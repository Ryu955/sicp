#lang sicp


; fibの例1
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 5)
; -> 5
(fib 6)
; -> 8

; (fib 5)の手続きを追ってみる
(fib 5)
; 手続きの本体を取り出す
(cond ((= 5 0) 0)
      ((= 5 1) 1)
      (else (+ (fib (- 5 1)) (fib (- 5 2)))))
; else に行く
(+ (fib 4) (fib 3))
; (fib 4) と (fib 3) の手続きの本体を取り出して評価する
(+ (+ (fib 3) (fib 2)) (+ (fib 2)) (fib 1))
; (fib 3) (fib 2) (fib 1)の手続きの本体を取り出して評価する
(+ (+ (fib 2) (fib 1)) (+ (fib 1) (fib 0)) (+ (fib 1) (fib 0) 1))
(+ (+ (fib 1) (fib 0) 1) (+ 1 0) (+ 1 0 1))
(+ (+ 1 0 1) (+ 1 2))
; -> 5

; 例1は再帰的

; -----------------------


; fibの例2
(define (fib-2 n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib-2 5)
; -> 5
(fib-2 6)
; -> 8

; (fib-2 5) の手続きを追ってみる
(fib-2 5)
; 手続きの本体を取り出し、仮引数を実引数へ
(fib-iter 1 0 5)
; fib-iterの手続きの本体を取り出し、仮引数を実引数へ
(if (= 5 0)
    0
    (fib-iter (+ 1 0) 1 (- 5 1)))
; 5 != 0 なので代替部を評価
(fib-iter 1 1 4)
(if (= 4 0)
    1
    (fib-iter (+ 1 1) 1 (- 4 1)))
; 4 != 0なので代替部を評価
(fib-iter 2 1 3)
(fib-iter 3 2 2)
(fib-iter 5 3 1)
(fib-iter 8 5 0)
; -> 5

; 例2は反復的


; ----------------------

; 例: 両替の計算
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 5)
; -> 2
(count-change 15)
; -> 6
(count-change 50)
; -> 50

(count-change 10)
; -> 4
; 1 * 10
; 1 * 5 + 5 * 1
; 5 * 2
; 10 * 1

; 手続きの本体を取り出す
(cc 10 5)
; amount = 10, kinds-of-coins = 5
(cond ((= 10 0) 1)
      ((or (< 10 0) (= 5 0)) 0)
      (else (+ (cc 10 (- 5 1))
               (cc (- 10 (first-denomination 5)) 5))))
; elseへ
; (first-denomination 5) -> 50
(+ (cc 10 4) (cc (- 10 50) 5))


; (cc 10 4) を評価
; amount 10, kinds-of-coins = 4
(cond ((= 10 0) 1)
      ((or (< 10 0) (= 4 0)) 0)
      (else (+ (cc 10 (- 4 1)) ( cc (- 10 (first-denomination 4)) 4))))
; elseへ
; (first-denomination 4) -> 25
(+ (cc 10 3) (cc -15 4))

; (cc -40 5) を評価
(cond ((= -40 0) 1)
      ((or (< -40 0) (= 5 0)) 0)
      (else (+ (cc -40 (- 5 1)) (cc (- -40 (first-denomination 5)) 5))))
; (< -40 0) #t なので
; -> 0

(+ (cc 10 4) (cc -40 5))
; -> (+ (+ (cc 10 3) (cc -15 4)) 0)

; (+ (+ (cc 10 3) (cc -15 4)) 0) を分けて評価
; (cc 10 3) を評価
(cond ((= 10 0) 1)
      ((or (< 10 0) (= 3 0))0)
      (else (+ (cc 10 (- 3 1))
               (cc (- 10 (first-denomination 3)) 3))))
; elseへ
; (first-denomination 3) -> 10
(+ (cc 10 2) (cc (- 10 10) 3))
; (cc 10 3)
; -> (+ (cc 10 2) (cc 0 3))

; (cc -40 5) は、amount（-40） が 0よりも小さいので0になる
(+ (+ (cc 10 3) (cc -15 4)) 0)
; -> (+ (+ (+ (cc 10 2) (cc 0 3)) 0) 0)

; (cc 10 2) と (cc 0 3) を分けて評価
; (cc 10 2) を評価
(cond ((= 10 0) 1)
      ((or (< 10 0) (= 2 0))0)
      (else (+ (cc 10 (- 2 1))
               (cc (- 10 (first-denomination 2)) 2))))
; elseへ
; (first-denomination 2) -> 5
(+ (cc 10 1) (cc (- 10 5) 2))
; (cc 10 2)
; -> (+ (cc 10 1) (cc 5 2))


; (cc 10 1) と (cc 5 2) をそれぞれ評価
(cc 10 1)
(cond ((= 10 0) 1)
      ((or (< 10 0) (= 1 0)) 0)
      (else (+ (cc 10 (- 1 1))
               (cc (- 10 (first-denomination 1)) 1))))
; elseへ
; (first-denomination 1) -> 1
(+ (cc 10 0) (cc (- 10 1) 1))
; (cc 10 1)
; -> (+ (cc 10 0) (cc 9 1))


(cc 5 2)
(cond ((= 5 0) 1)
      ((or (< 5 0) (= 5 0)) 0)
      (else (+ (cc 5 (- 2 1))
               (cc (- 5 (first-denomination 2)) 2))))
 
; elseへ
; (first-denomination 2) -> 5
(+ (cc 5 1) (cc (- 5 5) 2))
; (cc 5 2)
; -> (+ (cc 5 1) (cc 0 2))


(cc 9 1)
(cond ((= 9 0) 1)
      ((or (< 9 0) (= 1 9)) 0)
      (else (+ (cc 9 (- 1 1))
               (cc (- 9 (first-denomination 1)) 1))))
; else
(+ (cc 9 0) (cc 8 1))

(cc 5 1)
(+ (cc 5 0) (cc 4 1))

(+ (cc 4 0) (cc 3 1))














