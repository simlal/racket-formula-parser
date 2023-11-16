#lang racket

(define pliste `(a 1 b 2 c 3))

(define (properties plist)
    (cond
        [(null? plist) '()]
        [else (cons (car plist) (properties (cddr plist)))]))
(properties pliste)

(define (property name plist)
    (cond
        [(null? plist) plist]
        [(eq? name (car plist)) (cadr plist)]
        [else (property name (cddr plist))]))

(property 'b pliste)