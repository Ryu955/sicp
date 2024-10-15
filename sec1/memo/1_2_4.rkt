#lang sicp
; 線形再帰
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(expt 2 3)
(if (= 3 0)
    1
    (* 2 (expt 2 (- 3 1))))
; (= 3 0) -> #f
(* 2 (expt 2 2))
(* 2 (if (= 2 0)
         1
         (* 2 (expt 2 (- 2 1)))))
; (= 2 0) -> #f
(* 2 (* 2 (expt 2 1)))
(* 2 (* 2 (if (= 1 0)
              1
              (* 2 (expt 2 (- 1 1))))))
; (= 1 0) -> #f
(* 2 (* 2 (* 2 (expt 2 0))))
(* 2 (* 2 (* 2 (if (= 0 0)
                   1
                   (* 2 (expt 2 (- 0 1)))))))
; (= 0 0) -> #t
(* 2 (* 2 (* 2 1)))
; -> 8

; 線形反復
(define (expt2 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product)))) 
(expt2 2 3)
(expt-iter 2 3 1)
(if (= 3 0)
    1
    (expt-iter 2
               (- 3 1)
               (* 2 1)))
; (= 3 0) -> #f
(expt-iter 2 2 2)
(if (= 2 0)
    2
    (expt-iter 2
               (- 2 1)
               (* 2 2)))
; (= 2 0) -> #f
(expt-iter 2 1 4)
(if (= 1 0)
    4
    (expt-iter 2
               (- 1 1)
               (* 2 4)))
; (= 1 0) -> #f
(expt-iter 2 0 8)
(if (= 0 0)
    8
    (expt-iter 2
               (- 0 1)
               (* 8 2)))
; (= 0 0) -> #t
; -> 8

; 逐次平方
(define (square n) (* n n))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 4)
(cond ((= 4 0) 1)
      ((even? 4) (square (fast-expt 2 (/ 4 2))))
      (else (* 2 (fast-expt 2 (- 4 1)))))
; (= 4 0) -> #f
; (even? 4) -> #t
(square (fast-expt 2 (/ 4 2)))
(square (fast-expt 2 2))
(square (cond ((= 2 0) 1)
              ((even? 2) (square (fast-expt 2 (/ 2 2))))
              (else (* 2 (fast-expt 2 (- 2 1))))))
; (= 2 0) -> #f
; (even? 2) -> #t
(square (square (fast-expt 2 1)))
(square (square (cond ((=  1 0) 1)
                      ((even? 1) (square (fast-expt 2 (/ 1 2))))
                      (else (* 2 (fast-expt 2 (- 1 1)))))))
; (= 1 0) -> #f
; (even? 1) -> f
(square (square (* 2 (fast-expt 2 0))))
(square (square (* 2 (cond ((= 0 0) 1)
                           ((even? 0) (square (fast-expt 2 (/ 0 2))))
                           (else (* 2 (fast-expt 2 (- 0 1))))))))
; (= 0 0) -> #t
(square (square (* 2 1)))
(square (square 2))
; (square 2) -> 4
(square 4)
; -> 16


























