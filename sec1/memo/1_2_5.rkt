#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 16 28)
(gcd 206 40)

(gcd 16 28)
(gcd 28 (remainder 16 28))
; (remainder 16 28) -> 16
(gcd 28 16)
(gcd 16 (remainder 28 16))
; (remainder 28 16) -> 12
(gcd 16 12)
(gcd 16 (remainder 16 12))
; (remainder 16 12) -> 4
(gcd 16 4)
(gcd 4 (remainder 16 4))
; (remainder 16 4) -> 0
(gcd 4 0)
; -> 4

(gcd 16 28)
(gcd 28 16)
(gcd 16 12)
(gcd 16 4)
(gcd 4 0)
; 4ステップ

