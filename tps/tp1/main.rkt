#lang racket
(provide calculer)
(provide prefixee)

(provide creer-formule)
(provide nombre?)
(provide variable?)
(provide operateur?)
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

; retourne une formule prefixee a partir d'une formule (construit a partir exp-infixe)
(define (prefixee formule)
    (cond
        [(null? formule) `()]
        [(list? formule)]))

; creer une formule (sous format arbre binaire) a partir d'une expression infixe
(define (creer-formule exp-infixe)
  (cond
    [(null? exp-infixe) `()]
    ; creer une feuille lors de l'appel recursif
    [(or (nombre? exp-infixe) (variable? exp-infixe)) 
        (creer-feuille exp-infixe)]
    ; creer feuille pour expression avec 1 seul element
    [(and (list? exp-infixe) (= (length exp-infixe) 1))
        (creer-feuille (car exp-infixe))]
    ; construction arbres avec appel recursif
    [(list? exp-infixe)
        (creer-arbre (cadr exp-infixe)
            (creer-formule (car exp-infixe))
            (creer-formule (caddr exp-infixe)))]))
    

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

; verifie si element est un operateur primitif
(define (operateur? element)
    (define operateurs `(+ - * /))
    (if (member element operateurs) 
        (car (member element operateurs))
        #f))

; retourne l'operateur / noeud d'une formule
(define (operateur formule)
    (if (not (feuille? formule))
        (noeud-arbre formule)
        "Impossible trouver operateur d'une feuille"))

; retourne l'operande1 / feuille gauche d'une formule
(define (operande1 formule)
    (if (not (feuille? formule))
        (noeud-arbre (fils-g formule))
        "Impossible trouver operande1 d'une feuille"))

; retourne l'operande2 / feuille droite d'une formule
(define (operande2 formule)
    (if (not (feuille? formule))
        (noeud-arbre (fils-d formule))
        "Impossible trouver operande2 d'une feuille"))

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


; (require racket/trace)
; (trace creer-formule)
; (trace creer-arbre)
; (trace creer-feuille)
; (define expinf1 `((1 + 2) * 3))

; (creer-formule expinf1)