#lang racket
; (require racket/trace)

(define (liste-plate? a-list)
    (cond 
        [(null? a-list) #t]
        [(pair? (car a-list)) #f]
        [else (liste-plate? (cdr a-list))]))

(define Lettres `(a b (c d) (e (f) g)))

; (trace liste-plate?)
(liste-plate? Lettres)
(liste-plate? `(a b c))
; (untrace liste-plate?)
