#lang racket

(define (carre n) (* 2 n))
(define moyenne (lambda (x y) (/ (+ x y) 2)))
(define moyenne3 (lambda (x y z) (/ (+ x y z) 3)))

(println "moyenne 3 et 7")
(moyenne 3 7)

(println "moyenne 4, -12 et 9/10")
(moyenne3 4 -12 (/ 9 10))

(define aire-cercle (lambda (r) (* pi (carre r))))
(println "Aire du cercle")
(aire-cercle 2)
