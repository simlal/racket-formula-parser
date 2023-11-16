#lang racket

(define Lettres '(a b (c d) (e (f) g)))

(define (nombre-occurences s liste)
    (cond 
        [(empty? liste) 0]
        [(equal? s (car liste)) (+ 1 (nombre-occurences s (cdr liste)))]
        [else (nombre-occurences s (cdr liste))]))

(nombre-occurences `g Lettres)