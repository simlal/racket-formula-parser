#lang racket

; Ex1 fct de lissage

(define (lissage f dx)
    (lambda (x) 
        (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

; liste nb
(define listex (list 1 2 3 4 5 6 7 8 9 10))

; fct lineaire simple
(define (carre x) (* x x))

; accumuler
(define (accumuler liste fct)
    (cond
        [(null? liste) '()]
        [else (cons (if (procedure? (fct (car liste)))
                       ((fct (car liste)))
                       (fct (car liste)))
                    (accumuler (cdr liste) fct))]))


(accumuler listex carre)
(accumuler listex (lissage carre 2.0))

; ex2: enumeration nb (version recursive)
