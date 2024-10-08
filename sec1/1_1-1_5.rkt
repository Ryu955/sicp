#lang sicp

(define a 3)

a

(define b (+ a 1))

(+ a b (* a b))
(+ a (+ a 1) (* a (+ a 1)))
(+ 3 (+ 3 1) (* 3(+ 3 1)))
(+ 3 (+ 3 1)(+ 9 1))
(+ 3 (+ 3 1)(* 3 4))

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))


(define (sum-num a b c) (+ a b c))

(define (get-min-num a b)(if (> a b)
                             b
                             a))

(get-min-num 2 3)

(define (get-min-num-of-three  a b c)
  (get-min-num a (get-min-num b c)))

(get-min-num-of-three 5 3 7)


(define (square a) (* a a))

(square 3)


(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 1 2)

(define (sum-of-suquare-two a b c)
 (cond ((and (>= b a) (>= c a)) (sum-of-squares b c))
       ((and (>= c b) (>= a b)) (sum-of-squares a c))
       ((and (>= a c) (>= b c)) (sum-of-squares a b))))


(sum-of-suquare-two 4 2 3)



(if (and (> b a) (< b (* a b)))
    b
    a)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(p)

(test 0 (p))

(test 0 2)


