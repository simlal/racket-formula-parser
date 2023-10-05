#lang racket

(define (keys alist) 
    (if (null? alist)
        alist
        (cons (caar alist) (keys (cdr alist)))))

(define a-list-cons
    `((a . 1) (b . 2) (c . 3)))

(keys a-list-cons)

(define (value key  alist)
    (cond
        [(null? alist) alist]
        [(eq? key (caar alist)) (cdar alist)]
        [else (value key (cdr alist))]))

(value `c a-list-cons)
