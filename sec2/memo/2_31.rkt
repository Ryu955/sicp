#lang sicp


(define (square x)
  (* x x))

(define (square-tree tree) (tree-map square tree))

