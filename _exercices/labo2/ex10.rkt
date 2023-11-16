#lang racket

(define (Liste-elt-niveau liste n)
  (cond 
    [(null? liste) `()]
    [(= n 1) (cons (car liste) (Liste-elt-niveau (cdr liste) n))]
    [else (if (list? (car liste))
              (cons (Liste-elt-niveau (car liste) (- n 1)) 
                    (Liste-elt-niveau (cdr liste) n))
              (Liste-elt-niveau (cdr liste) n))]))

 (Liste-elt-niveau '(a 1 (b 2) ((c 3)) 4 (5 t)) 2)

