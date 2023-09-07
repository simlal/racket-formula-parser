#lang racket

(define (racine-R+ x)
(if (positive? x) (sqrt x) #f))
(println "test #f: x < 0")
(racine-R+ -5)

(println "test val sqrt: x > 0 and x = 9 so res = 3")
(racine-R+ 9)
