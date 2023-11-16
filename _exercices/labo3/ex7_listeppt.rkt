#lang racket

(define a-list-cons
    `((a . 1) (b . 2) (c . 3)))

(define (p-list-cons liste)
  (cond
    ((null? liste) '())
    (else (cons (caar liste) (cons (cdar liste) (p-list-cons (cdr liste)))))))

(p-list-cons a-list-cons)

