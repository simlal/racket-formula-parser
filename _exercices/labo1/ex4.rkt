#lang racket

(define non-nul-1 (lambda (x) (not (equal? x 0))))
(println "test false: 4 != 0")
(non-nul-1 4)
(println "test true: 0 == 0")
(non-nul-1 0)

(define (non-nul-2 x)
    (and (integer? x) (not (equal? x 0))))
(println "test false: 'four' not an int")
(non-nul-2 "four")

(println "test true: 4 (int) != 0")
(non-nul-2 4)

(println "test false: 0 == 0")
(non-nul-2 0)

; (equal)
