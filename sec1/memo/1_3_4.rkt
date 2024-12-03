#lang sicp

; --- 必要な手続き
(define (average a b) (/ (+ a b) 2))
(define (square x) (* x x))

; --- average-damp
(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)
; -> 55

; --- 1.3.3 の fixed-point
(define tolerance 0.00001)


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; --- fixed-point と average-damp を使った sqrt
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))


(sqrt 2)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(cube-root 2)

; ---- Newton法 ----

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cube x) (* x x x))

((deriv cube) 5)
; 75.00014999664018

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-2 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(sqrt-2 2)
; 1.4142135623822438


