#lang racket
(provide calculer)
(provide prefixee)

(provide creer-formule)
(provide nombre?)
(provide variable?)
(provide operateur)
(provide operande1)
(provide operande2)

(provide creer-env)
(provide lier)
(provide valeur)
(provide definie?)

; calculer : formule env -> nombre
; calcule la valeur de la formule en utilisant les valeurs dans l'environnement
(define (calculer formule env)
    (formule env))

; retourne une formule prefixee a partir d'une formule quelconque
(define (prefixee formule)
    (creer-formule formule))

; creer une formule a partir d'une expression infixe
(define (creer-formule exp-infixe)
    (exp-infixe))

; verifie si la formule est un nombre
(define (nombre? formule)
    (number? formule))

; verifie si la formule est une variable
(define (variable? formule)
    (symbol? formule))

; Representation sous arbre binaire (noeud=operateur, feuille=operande)

; retourne l'operateur / noeud d'une formule
; TODO CHECK FEUILLE OU NOEUD
(define (operateur formule)
    (formule))

; retourne l'operande1 / feuille gauche d'une formule
; TODO CHANGE
(define (operande1 formule)
    (formule))

; retourne l'operande2 / feuille droite d'une formule
; TODO CHANGE
(define (operande2 formule)
    (formule))

;;;;; Fonctions associees a environment d'exe ;;;;;

; *OK
; creer un environnement vide (a remplir avec liste de paires (variable, valeur))
(define (creer-env)
    (list))


; *OK
; lier variable a valeur dans l'environnement
; Utilisation de pairs d'associations
(define (lier variable valeur env)
    (cons (cons variable valeur) env))

; retourne la valeur associee a la variable dans l'environnement
; TODO CHECK
(define (valeur variable env)
    (cond
        [(null? env) (display (format "Variable ~v pas dans environement\n" variable))]
        [(equal? variable (caar env)) (cdar env)]
        [else (valeur variable (cdr env))]))

; *OK
; verifie si la variable est definie dans l'environnement
(define (definie? variable env)
        (cond
            [(null? env) #f]
            [(equal? variable (caar env)) #t]
            [else (definie? variable (cdr env))]))


