#lang racket

(println "Exercice1")
(require math)
(define (calcul1) (+ 5 (/ 45 0.35) (* 2 (sin (/ 1 2)))))
(println "calcul1 sans arg")
(calcul1)

(println "calcul2 avec arg")
(define (calcul2 c) (+ (* 3 c) (/ c 4)))
(calcul2 20)

