#lang racket

(define (fact n)
    (define (fact-iter cpt res n) 
        (if (> cpt n)
            res
            (fact-iter (+ cpt 1) (* res cpt) n)))
    (fact-iter 1 1 n))
(fact 4)