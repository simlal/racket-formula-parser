#lang racket

(define (somme* liste)
    (cond 
        [(empty? liste) 0]
        [(list? (car liste))
            (+ (somme* (car liste))
                (somme* (cdr liste)))]
        [(number? (car liste)) (+ (car liste) (somme* (cdr liste)))]
        [else (somme* (cdr liste))]))

(somme* `(a 1 (b 2) ((c 3)) 4))
