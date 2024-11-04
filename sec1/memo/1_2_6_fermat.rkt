#lang sicp
; ------------
; フェルマーの小定理
; a^n ≡ a (mod n)
; nが素数, a < n

; a = 1, n = 5
; 1^5 = 1
; 1 ≡ 1 (mod 5)

; a = 2, n = 5
; 2^5 = 32
; 32 ÷ 5 = 6 余り 2
; 2 ≡ 2 (mod 5)

; a = 3, n = 5
; 3^5 = 243
; 243 ÷ 5 = 48 余り 3
; 3 ≡ 3 (mod 5)

; a = 4, n = 5
; 4^5 = 1024
; 1024 ÷ 5 = 204 余り 4
; 4 ≡ 4 (mod 5)
; ------------


(define (square x) (* x x))

; base^exp % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(fermat-test 7)
; -> #t
(fermat-test 6)
; -> #f
(fermat-test 5)
; -> #t

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; 手続きを追ってみる
(fast-prime? 5 1)
(fermat-test 5)
; (try-it (+ 1 (random (- 5 1))))
; (random 4)-> 2とする
; (+ 1 2) -> 3
; (try-it 3)
(= (expmod 3 5 5) 3)
; base 3, exp 5, m 5
; (= 5 0) -> #f
; (even? 5) -> #f
(remainder (* 3 (expmod 3 (- 5 1) 5)) 5)
(remainder (* 3 (expmod 3 4 5)) 5)
; (expmod 3 4 5)
; (= 4 0) -> #f
; (even? 4) -> #t
; (expmod 3 4 5) -> (remainder (square (expmod 3 (/ 4 2) 5)) 5)
(remainder (* 3 (remainder (square (expmod 3 2 5)) 5)) 5)
; (expmod 3 2 5)
; (= 2 0) -> #f
; (even? 2) -> #t
; (expmod 3 2 5) -> (remainder (square (expmod 3 (/ 2 2) 5)) 5)
(remainder (* 3 (remainder (square (remainder (square (expmod 3 1 5)) 5)) 5)) 5)
; (expmod 3 1 5)
; (= 1 0) -> #f
; (even? 1) -> #f
; (expmod 3 1 5) -> (remainder (* 3 (expmod 3 (- 1 1) 5)) 5)
(remainder (* 3 (remainder (square (remainder (square (remainder (* 3 (expmod 3 0 5)) 5)) 5)) 5)) 5)
; (expmod 3 0 5)
; (= 0 0) -> #t
; (expmod 3 0 5) -> 1
(remainder (* 3 (remainder (square (remainder (square (remainder (* 3 1) 5)) 5)) 5)) 5)
(remainder (* 3 (remainder (square (remainder (square (remainder 3 5)) 5)) 5)) 5)
(remainder (* 3 (remainder (square (remainder (square 3) 5)) 5)) 5)
(remainder (* 3 (remainder (square (remainder 9 5)) 5)) 5)
(remainder (* 3 (remainder (square 4) 5)) 5)
(remainder (* 3 (remainder 16 5)) 5)
(remainder (* 3 1) 5)
(remainder 3 5)
3
; expmod 3 5 5) -> 3
; (= 3 3)
; -> #t

(expmod 5 10000000 10000000)



(fast-prime? 6 1)
; -> #tになったり#fになったりする
; 以下のパターンで成り立つ場合があるため、それを引くと#tになってしまう
; 1^6 ≡ 1 (mod 6)
; 3^6 ≡ 3 (mod 6)