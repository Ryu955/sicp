#lang sicp

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define x (make-interval 9.0 11.0))
(define y (make-interval 12.0 15.0))

(define xy (mul-interval x y))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(center xy) ; 136.5

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(width xy) ; 28.5

(define (percent i)
  (/ (width i) (center i)))

(percent xy) ; 0.2087912087912088
