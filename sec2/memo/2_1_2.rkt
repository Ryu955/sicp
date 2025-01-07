#lang sicp

(define (make-rat n d)
  (cons n d))


(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))


(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g)))

(define one-half (make-rat 2 4))

(numer one-half)
(denom one-half)


; memo

(define (make-rectangle width-segment height-segment)
  (cons width-segment height-segment))
(define (width-rectangle rectangle) (car rectangle))
(define (height-rectangle rectangle) (cdr rectangle))

(define (perimeter rectangle)
  (let ((base-line ()))

(define base-start-point (make-point 0 0))
(define base-end-point (make-point 5 0))
(define base-segment (make-segment base-start-point base-end-point))

(define height-start-point (make-point 0 0))
(define height-end-point (make-point 0 3))
(define height-segment (make-segment height-start-point height-end-point))

(define my-rectangle (make-rectangle base-rectangle height-rectangle))
