#lang sicp

; consの使い方

(define x (cons 1 2))
x
; -> (1 . 2)
(car x)
; -> 1
(cdr x)
; -> 2

(define y (cons 3 4))
y
; -> (3 . 4)
(define z (cons x y))
; -> ((1 . 2) . (3 . 4))
(car (car z))
;- > 1
(cdr (car z))
;  -> 2
(car (cdr z))
; -> 3
(cdr (cdr z))
; -> 4



; -- make-rat の実装
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))


; -- helper

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define one-half (make-rat 1 -2))
(print-rat one-half)



; ---2.1の考え
; ↓ な感じのconsを作ればよさそう
(define test (cons - (cons 1 2)))
test
(car (cdr test))
; -> 1
(cdr (cdr test))
; -> 2
((car test) 1 2)
; -> -1


(define (make-rat combiner n d)
  (let ((g (gcd n d)))
    (cons combiner (cons (/ n g) (/ d g)))))

(define (combiner x) (car x))

(define (numer x) (car (cdr x)))

(define (denom x) (cdr (cdr x)))

(define (print-rat x)
  (display (combiner x))
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define minus-one-half (make-rat - 1 2))
(print-rat minus-one-half)

; 違うっぽい