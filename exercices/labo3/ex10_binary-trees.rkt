#lang racket

(define (creer-arbre-vide) 
    (`()))

(define (creer-feuille etiquette)
    (list etiquette `() `()))

(define (creer-arbre etiquette fils-g fils-d) 
    (list etiquette fils-g fils-d))

(define (fils-g arbre)
    (if (not (vide? arbre))
        (cadr arbre)
        0))

(define (fils-d arbre)
    (if (not (vide? arbre))
        (caddr arbre)
        0))

(define (vide? arbre)
    (null? arbre))

(define (feuille? arbre)
    (and (not (vide? arbre))
         (null? (fils-g arbre))
         (null? (fils-d arbre))))

(define a1 (creer-arbre `a (creer-arbre `g (creer-feuille 1) (creer-feuille 10)) (creer-arbre `d (creer-feuille 2) `())))
a1
(define g (creer-arbre 'g (creer-feuille '1) (creer-feuille `10)))
(define d (creer-arbre 'd (creer-feuille '2) `()))
(define a1_2 (creer-arbre 'a g d))
a1_2

; with quote
(define a2 `(a (g (1 () ()) (10 () ())) (d (2 () ()) ())))
a2

; calculer nb feuilles
(define (nombres-feuilles-b arbre)
    (if (vide? arbre)
        0
        (if (feuille? arbre)
            1
            (+ (nombres-feuilles-b (fils-g arbre))
               (nombres-feuilles-b (fils-d arbre))))))

(nombres-feuilles-b a1)

; flatten the tree
; (define (aplat-ar-test arbre)
;     (cond
;         [(vide? arbre) `()]
;         [(feuille? (car liste)) (append (aplatir (car liste)) (aplatir (cdr liste)))]
;         [else (cons (car liste) (aplatir (cdr liste)))]))

(define (flatten-into-list arbre)
    (if (vide? arbre)
        `()
        (if (feuille? arbre)
            (list (car arbre))
            (append (flatten-into-list (fils-g arbre))
                    (flatten-into-list (fils-d arbre))))))
(flatten-into-list a1)