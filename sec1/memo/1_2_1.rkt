#lang sicp

; 線形再帰プロセス
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 6)
(= 6 1)
; -> #f
(* 6 (factorial (- 6 1)))
; -> (* 6 (factorial 5))
(factorial 5)
(= 5 1)
; -> #f
(* 5 (factorial (- 5 1)))
; -> (* 5 (factorial 4))
(* 6 (* 5 (factorial 4)))
; ....
(* 6 (* 5 (* 4 (* 3 (* 2 1)))))
(* 6 (* 5 (* 4 (* 3 2))))
(* 6 (* 5 (* 4 6)))
; ...
720


; 線形反復プロセス（iterative process）
(define (factorial2 n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
(factorial2 6)
(fact-iter 1 1 6)
; if式を評価
(> 1 6)
; -> #f
(fact-iter (* 1 1) (+ 1 1) 6)
(fact-iter 1 2 6)
; if式を評価
(> 2 6)
; -> #f
(fact-iter (* 2 1) (+ 2 1) 6)
(fact-iter 2 3 6)
; ...
(fact-iter 620 7 6)
(> 7 6)
; -> #t
720




















