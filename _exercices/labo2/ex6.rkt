#lang racket

(require racket/trace)

(define (aplatir liste)
    (cond
        [(null? liste) `()]
        [(list? (car liste)) (append (aplatir (car liste)) (aplatir (cdr liste)))]
        [else (cons (car liste) (aplatir (cdr liste)))]))

(define Lettres '(a b (c d) (e (f) g)))
(trace aplatir)
(aplatir Lettres)
(untrace aplatir)
