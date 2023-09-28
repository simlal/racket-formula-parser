#lang racket

(define (keys alist) 
    (if (null? alist)
        alist
        (cons (caar alist) (keys (cdr alist)))))

(define a-list-cons
    `((a . 1) (b . 2) (c . 3)))

(keys a-list-cons)
