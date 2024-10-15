#lang sicp
; Fibonacci数を対数的ステップ数で計算するうまいアルゴリズムがある.
; 1.2.2 節のfib-iterプロセスで使った状態変数aとbの変換: a ← a + bとb ← aに注意しよう. この変換をTと呼ぶ. 1と0から始め, Tを繰り返してn回作用させると, Fib(n + 1)とFib(n)の対が出来る.
; いいかえれば, Fibonacci数は対(1, 0)にTn, つまり変換Tのn乗を作用させると得られる.
; さて, Tpqは対(a, b)をa ← bq + aq + apとb ← bp + aqに従って変換するものとし, Tを変換族Tpqのp = 0とq = 1の特例としよう.
; 変換Tpqを二回使うとその効果は同じ形式の変換Tp'q'を一回使ったのと同じになることを示し, p'とq'をp, qを使って表せ. これで変換を二乗する方法が得られ, fast-exptのように逐次平方を使い, Tnを計算することが出来る.
; これらをすべてまとめ, 対数的ステップ数の以下の手続きを完成せよ

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   2      ; p'を計算
                   1      ; q'を計算
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 5)


; memo 1.2.2のfibonacci
;(define (fib n)
;  (cond ((= n 0) 0)
;        ((= n 1) 1)
;        (else (+ (fib (- n 1))
;                 (fib (- n 2))))))

;(define (fib n)
;  (fib-iter 1 0 n))
;(define (fib-iter a b count)
;  (if (= count 0)
;      b
;      (fib-iter (+ a b) a (- count 1))))
; (fib-iter 1 0 5)
; (fib-iter 1 1 4)
; (fib-iter 2 1 3)
; (fib-iter 3 2 2)
; (fib-iter 5 3 1)
; (fib-iter 8 5 0)