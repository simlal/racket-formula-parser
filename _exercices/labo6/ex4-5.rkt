#lang racket

(define (my-cons x y)
  (lambda (m) (m x y)))
(define (my-car z)
  (z (lambda (p q) p)))
(define (my-cdr z)
  (z (lambda (p q) q)))

(my-car (my-cons 1 2))


(my-car (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q ) p))
((lambda (p q) p ) 1 2)

;same for my-cdr but last line is q instead of p so returns 2

;ex 5 higher order funcs;

(define l1 `(2 2 4 4))
(define l2 `(1 3 5 4))

(define (produit-scalaire v t)
  (apply + (map * v t)))
(equal? (produit-scalaire l1 l2) (+(* 2 1) (* 2 3) (* 4 5) (* 4 4)))

