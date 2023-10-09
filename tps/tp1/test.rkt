#lang racket

(require "main.rkt")
(require racket/trace)

; test lier
(display "test lier\n")
(define env1 (lier `a 1 (lier `b 2 (lier `c 3 `()))))
env1

; test definie
(display "\ntest definie?\n")
(definie? `a env1)
(definie? `d env1)

; test valeur
(display "\ntest valeur\n")
(valeur `d env1)
(valeur `c env1)


; test creer-feuille
(display "\ntest creer-feuille\n")
(creer-feuille 1)

; test creer-arbre
(display "\ntest creer-arbre\n")
(define a1 (creer-arbre `a (creer-feuille 1) (creer-feuille 2)))
(display (format "arbre a1: ~a\n" a1))
(define a2 (creer-arbre `c (creer-arbre `g (creer-feuille 1) (creer-feuille 10)) (creer-arbre `d (creer-feuille 2) `())))
(display (format "arbre a2: ~a\n" a2))

; test fils-g
(display "\ntest fils-g\n")
(display (format "(fils-g a1): ~a\n" (fils-g a1)))
(display (format "(fils-g a2): ~a\n" (fils-g a2)))
(display (format "(fils-g feuille-simple): ~a\n" (fils-g (creer-feuille 10))))

; test fils-d
(display "\ntest fils-d\n")
(display (format "fils-d a1: ~a\n" (fils-d a1)))
(display (format "fils-d a2: ~a\n" (fils-d a2)))
(display (format "fils-d feuille simple: ~a\n" (fils-d (creer-feuille 10))))

; test feuille?
(display "\ntest feuille?\n")
(display (format "(feuille? a1): ~a\n" (feuille? a1)))
(display (format "(feuille? (fils-g a1)): ~a\n" (feuille? (fils-g a1))))
(display (format "(second-arbre a2): ~a\n" (second-arbre a2)))
(display (format "(feuille? (fils-d (second-arbre a2))): ~a\n" (feuille? (fils-d (second-arbre a2)))))

; test noeud-arbre
(display "\ntest noeud-arbre")
(display (format "(noeud-arbre a1): ~a\n" (noeud-arbre a1)))

(display "\ntest helper funcs\n")
; test operateur
(display (format"test (operateur a1): ~a\n" (operateur a1)))
(display (format"test (operateur (fils-g a1)): ~a\n" (operateur (fils-g a1))))
; test operande1
(display (format"test (operande1 a1): ~a\n" (operande1 a1)))
(display (format"test (operande1 (fils-g a1)): ~a\n" (operande1 (fils-g a1))))
; test operande2
(display (format"test (operande2 a1): ~a\n" (operande2 a1)))
(display (format"test (operande2 (fils-d a1)): ~a\n" (operande2 (fils-d a1))))

; test operateur?
(display "\ntest operateur?\n")
(display (format"(operateur? (car `(1 + 2))): ~a\n" (operateur? (car `(1 + 2)))))
(display (format"(operateur? (car `((* 1 2))): ~a\n" (operateur? (car `(* 1 2)))))

; test creer formule
(display "\ntest creer-formule\n")
(define expinf1 `((1 + 2) * 3))
(display (format "(creer-formule expinf1): ~a\n" (creer-formule expinf1)))
; eval par sub
; (creer-arbre `* (creer-formule `(1 + 2)) (creer-formule `(3)))
; (creer-arbre `* (creer-arbre `+ (creer-feuille 1) (creer-feuille 2)) (creer-feuille 3))
; (creer-arbre `* (creer-arbre `+ (list 1 `() `()) (list 2 `() `())) (list (3 `() `())))
; (creer-arbre `* (list (`+ `(1 `() `()) `(2 `() `()))) `(3 `() `()))
; (list (`* `(`+ `(1 `() `()) `(2 `() `())) `(3 `() `())))
; `(`* `(`+ `(1 `() `()) `(2 `() `())) `(3 `() `()))
(display "\ntest exps dans enonce\n")
(define exp1 (creer-formule `( 1 )))
(define exp2 (creer-formule `( b )) )
(define exp3 (creer-formule `(1 + 2)) )
(define exp4 (creer-formule `(a + 3)) )
(define exp5 (creer-formule `((a + b) + 2)))
(define exp6 (creer-formule `((a + b) * 3)) )
(define exp7 (creer-formule `(((a + b) * 3) - 4)) )
(define exp8 (creer-formule `(a + (b * 3)) ))
(display (format "(define exp1 (creer-formule `( 1 ))):\n~a\n" exp1))
(display (format "(define exp2 (creer-formule `( b ))):\n~a\n" exp2))
(display (format "(define exp3 (creer-formule `(1 + 2))):\n~a\n" exp3))
(display (format "(define exp4 (creer-formule `(a + 3))):\n~a\n" exp4))
(display (format "(define exp5 (creer-formule `((a + b) + 2))):\n~a\n" exp5))
(display (format "(define exp6 (creer-formule `((a + b) * 3))):\n~a\n" exp6))
(display (format "(define exp7 (creer-formule `((a + b) * (3 - 4)))):\n~a\n" exp7))
(display (format "(define exp8 (creer-formule `(a + (b * 3))):\n~a\n" exp8))

(display "\ntest prefixee-formule\n")
(display (format "(prefixee exp1:\n~a\n" (prefixee exp1)))
(display (format "(prefixee exp2:\n~a\n" (prefixee exp2)))
(display (format "(prefixee exp3:\n~a\n" (prefixee exp3)))
(display (format "(prefixee exp4:\n~a\n" (prefixee exp4)))
(display (format "(prefixee exp5:\n~a\n" (prefixee exp5)))
(display (format "(prefixee exp6:\n~a\n" (prefixee exp6)))
(display (format "(prefixee exp7:\n~a\n" (prefixee exp7)))
(display (format "(prefixee exp8:\n~a\n" (prefixee exp8)))

; test calculer
(display "\ntest creation env\n")
(define env (lier `a
                    10
                    (lier `b
                        20
                        (lier `+
                            +
                            (lier `-
                                -
                                (lier `*
                                        *
                                        (lier `/
                                            /
                                            (creer-env))))))))

(display "(define env (lier `a 10 lier `b 20 lier `+ + lier `- - lier `* * lier `/ / creer-env)):\n")
env
(operande1 exp5)
(display (format "(calculer exp1 env):\n~a\n" (calculer exp1 env)))
(display (format "(calculer exp2 env):\n~a\n" (calculer exp2 env)))
(display (format "(calculer exp3 env):\n~a\n" (calculer exp3 env)))
(display (format "(calculer exp4 env):\n~a\n" (calculer exp4 env)))
(display (format "(calculer exp5 env):\n~a\n" (calculer exp5 env)))
(display (format "(calculer exp6 env):\n~a\n" (calculer exp6 env)))
(display (format "(calculer exp7 env):\n~a\n" (calculer exp7 env)))
(display (format "(calculer exp8 env):\n~a\n" (calculer exp8 env)))