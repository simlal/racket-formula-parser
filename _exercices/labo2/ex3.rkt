#lang racket
; (require racket/trace)

; Recursive func to get last num of list
(define (dernier ma-liste)
    (if (null? (cdr ma-liste))
        (car ma-liste)
        (dernier (cdr ma-liste))))
; (trace dernier)
(define Lettres `(a b (c d) (e (f) g)))
(dernier Lettres)
; (untrace dernier)