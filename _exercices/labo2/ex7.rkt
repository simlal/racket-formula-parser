#lang racket

(define Lettres '(a b (c d) (e (f) g)))

(define (profondeur liste)
    (cond
        [(empty? liste) + 1]
        [(list? (car liste)) (+ 1 (profondeur (cdr liste)))]
        [else (profondeur (cdr liste))]))

(profondeur Lettres)