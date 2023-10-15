#lang racket

;(require rackunit rackunit/gui)

(define (enumerer-entier n m)
  (if (> n m)
      '()
      (cons n (enumerer-entier (+ n 1) m))))

(define (liste-div n)
  (define (iter-div liste)
    (cond
      [(null? liste) liste]
      [(= (remainder n (car liste)) 0) (cons (car liste) (iter-div (cdr liste)))]
      [else (iter-div (cdr liste))]))
  (iter-div (enumerer-entier 1 n)))

(define (premier? n)
  (cond
    [(or (= n 1) (= n 2)) #t]
    [(> (length (liste-div n)) 2) #t]
    [else #f]))

(define (somme-carres-premier n m)
  (apply + (map(lambda (x) (* x x)) (filter premier? (enumerer-entier n m)))))

(somme-carres-premier 3 5)

 
  