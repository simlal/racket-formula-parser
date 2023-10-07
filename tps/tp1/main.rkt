#lang racket
(provide calculer)
(provide prefixee)

(provide creer-formule)
(provide nombre?)
(provide variable?)
(provide operateur)
(provide operande1)
(provide operande2)

(provide creer-arbre)
(provide creer-feuille)
(provide fils-g)
(provide fils-d)
(provide feuille?)
(provide noeud-arbre)
(provide second-arbre)
(provide trois-arbre)

(provide creer-env)
(provide lier)
(provide valeur)
(provide definie?)

; calcule la valeur de la formule en utilisant les valeurs dans l'environnement
(define (calculer formule env)
    (formule env))

; retourne une formule prefixee a partir d'une formule quelconque
(define (prefixee formule)
    (creer-formule formule))

; creer une formule a partir d'une expression infixe
(define (creer-formule exp-infixe)
    (exp-infixe))

;;;;;; Creation d'arbres binaires ;;;;;

; Creation d'un arbre avec operande
(define (creer-arbre etiquette fils-g fils-d)
    (list etiquette fils-g fils-d))

; Creation feuille (arbre avec 2 fils vide)
(define (creer-feuille etiquette)
    (list etiquette `() `()))

; Helper pour valider structure vide
(define (arbre-vide? arbre)
    (null? arbre))

; Selecteur lors du traversage de l'arbre
(define (noeud-arbre arbre)
    (car arbre))
(define (second-arbre arbre)
    (cadr arbre))
(define (trois-arbre arbre)
    (caddr arbre))

; Chercher le fils gauche de l'arbre ou feuille 
(define (fils-g arbre)
    (if (not (arbre-vide? arbre))
        (second-arbre arbre)
        `()))
; Chercher le fils droit de l'arbre ou feuille 
(define (fils-d arbre)
    (if (not (arbre-vide? arbre))
        (trois-arbre arbre)
        `()))

; Feuille doit contenir un ele mais des liste vides pour chacun de ses "fils"
(define (feuille? arbre)
    (and 
        (not (arbre-vide? arbre))
        (null? (fils-g arbre))
        (null? (fils-d arbre))))

;;;;;; Fonctions helpers pour representer la formule ;;;;;
; Representation sous arbre binaire (noeud=operateur, feuille=operande)
; verifie si la formule est un nombre
(define (nombre? formule)
    (number? formule))
; verifie si la formule est une variable
(define (variable? formule)
    (symbol? formule))

; retourne l'operateur / noeud d'une formule
(define (operateur formule)
    (if (not (feuille? formule))
        (noeud-arbre formule)
        `()))

; retourne l'operande1 / feuille gauche d'une formule
(define (operande1 formule)
    (if (not (feuille? formule))
        (fils-g formule)
        `()))

; retourne l'operande2 / feuille droite d'une formule
(define (operande2 formule)
    (if (not (feuille? formule))
        (fils-d formule)
        `()))

;;;;; Fonctions associees a environment d'execution ;;;;;

; creer un environnement vide (a remplir avec liste de paires (variable, valeur))
(define (creer-env)
    (`()))


; lier variable a valeur dans l'environnement
; Utilisation de pairs d'associations
(define (lier variable valeur env)
    (cons (cons variable valeur) env))

; retourne la valeur associee a la variable dans l'environnement
(define (valeur variable env)
    (cond
        [(null? env) (display (format "Variable ~v pas dans environement\n" variable))]
        [(equal? variable (caar env)) (cdar env)]
        [else (valeur variable (cdr env))]))

; verifie si la variable est definie dans l'environnement
(define (definie? variable env)
        (cond
            [(null? env) #f]
            [(equal? variable (caar env)) #t]
            [else (definie? variable (cdr env))]))


