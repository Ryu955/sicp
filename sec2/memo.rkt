#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 3 4))
; (1 2 3 4)
(accumulate cons (list 3 4) (list 1 2))
(cons (car (list 1 2)) (accumulate cons (list 3 4) (list 2)))
(cons 1 (cons (car (list 2)) (accumulate cons (list 3 4) (list))))
(cons 1 (cons 2 (list 3 4)))


(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
s
(car (car s))
(car (car (cdr s)))
(cdr (car s))


(define (filter seqs sequences)
  (if (null? seqs)
      sequences
      (filter (cdr seqs) (append sequences (list (car (car seqs)))))))

(define (filter-2 old-seqs new-seqs)
  (if (null? old-seqs)
      new-seqs
      (filter-2 (cdr old-seqs) (append new-seqs (list (cdr (car old-seqs)))))))

(filter s (list))
(filter-2 s (list))