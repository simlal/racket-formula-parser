#lang racket

(require racket/trace)

(define (renverser liste)
    (cond
        [(null? liste) `()]
        [(list? (car liste)) (append (renverser (cdr liste)) (list (renverser (car liste))))]
        [(append (renverser (cdr liste)) (list (car liste)))]))


; (trace renverser)
(renverser `(a (b d) c))
; (untrace renverser)

 