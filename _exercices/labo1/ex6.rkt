#lang racket
(define carre (lambda (n) (* n n)))

(define (somme-carre-if x y z)
    (if (and (< x y) (< x z))
        (+ (carre y) (carre z))
        (if (and (< y x) (< y z))
            (+ (carre x) (carre z))
            (if (and (< z x) (< z y))
                (+ (carre x) (carre y))
                void))))
(println "test-if x smallest + res=8")
(somme-carre-if 1 2 2)

(println "test-if y smallest + res=13")
(somme-carre-if 3 1 2)

(println "test-if z smallest + res=52")
(somme-carre-if 2 6 4)

; with cond statement
(define (somme-carre-cond x y z)
(cond 
    [(and (< x y) (< x z)) (+ (carre y) (carre z))]
    [(and (< y x) (< y z)) (+ (carre x) (carre z))]
    [(and (< z x) (< z y)) (+ (carre x) (carre y))]
    [else void]))

(println "test-cond x smallest + res=8")
(somme-carre-cond 1 2 2)

(println "test-cond y smallest + res=13")
(somme-carre-cond 3 1 2)

(println "test-cond z smallest + res=52")
(somme-carre-cond 2 6 4)
