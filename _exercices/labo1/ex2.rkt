#lang racket
; Fonction carre 
(define (carre n) (* 2 n))

; func cube (regular define)
(define (cube n) (* n n n))

; func cube (with lambda)
(define cube-lambda (lambda (n) * n n n))

; to calculate
(define (calcul x) (/ (+ (carre x) (* 3 (cube 51)))(* 5 (cube-lambda x))))

(println "Exercice2")
(calcul 10)
(calcul 10.0)
