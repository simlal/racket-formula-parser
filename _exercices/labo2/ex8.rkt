#lang racket

(define Lettres '(a b (c d) (e (a) g)))

(define (nombre-occurrences* s liste)
    (cond
        [(empty? liste) 0]
        [(list? (car liste)) 
        (+ (nombre-occurrences* s (car liste))
            (nombre-occurrences* s (cdr liste)))]
        [(equal? s (car liste)) (+ 1 (nombre-occurrences* s (cdr liste)))]
        [else (nombre-occurrences* s (cdr liste))]))

(nombre-occurrences* `a Lettres)