#lang sicp

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (display a)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (s k f a h n)
  (cond 
    ((= k 0) 
     (+ (f a) (s (+ k 1) f a h n))) ; 初項
    ((= k n)
     (f (+ a (* k h)))) ; 最後の項
    ((even? k) 
     (+ (* 2.0 (f (+ a (* k h)))) (s (+ k 1) f a h n))) ; 偶数番目の項
    (else 
     (+ (* 4.0 (f (+ a (* k h)))) (s (+ k 1) f a h n))))) ; 奇数番目の項

(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (simpson-func k)
      (cond 
    ((= k 0) 
     (f a)) ; 初項
    ((= k n)
     (f (+ a (* k (h))))) ; 最後の項
    ((even? k) 
     (* 2.0 (f (+ a (* k (h)))))) ; 偶数番目の項
    (else 
     (* 4.0 (f (+ a (* k (h)))))
    )))

  (* (/ (h) 3.0) (sum simpson-func a inc b)))

  
(simpson cube 0 1 100)

; なにかちがう