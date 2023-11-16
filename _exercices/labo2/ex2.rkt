#lang racket

(define Lettres `(a b (c d) (e (f) g)))

(println "extract a")
(car Lettres)

(println "extract b")
(car (cdr Lettres))
(cadr Lettres)

(println "extract c")
(car (car (cdr (cdr Lettres))))
(caaddr Lettres)

(println "extract d")
(car (cdaddr Lettres))

; `(a b (c d) (e (f) g))
(println "extract e")
(car (cadddr Lettres))

(println "extract f")
(caadr (cadddr Lettres))

(println "extract g")
(caddr (cadddr Lettres))
