#lang sicp

; 除数の探索
(define (smallest-divisor n)
  (find-divisor n 2))


(define (square x)
  (* x x))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b)
  (= (remainder b a) 0))


(smallest-divisor 11)
; 11
(smallest-divisor 100)
; 2

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 11)
; -> #t
(prime? 100)
; -> #f

; 素数でない場合の手続きを追ってみる
(smallest-divisor 15)
(find-divisor 15 2)
(cond ((> (square 2) 15) 15)
      ((divides? 2 15) 2)
      (else (find-divisor 15 (+ 2 1))))
; (> (square 2) 15) -> #f
; (divides? 2 15) -> #f
; elseへ
(find-divisor 15 3)
; (divides? 3 15) -> #t
; -> 3

; 素数の場合の手続きを追ってみる
(smallest-divisor 7)
(find-divisor 7 2)
(cond ((> (square 2) 7) 7)
      ((divides? 2 7) 2)
      (else (find-divisor 7 (+ 2 1))))
; (> 4 7) -> #f
; (divides? 2 7) -> #f
; elseへ
(find-divisor 7 3)
; (> (square 3) 7) -> #t
; -> 7

; (> (square n) test-divisor) があるので、どう頑張っても、√n以下で終わる