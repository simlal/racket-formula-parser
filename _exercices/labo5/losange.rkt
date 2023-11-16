#lang racket

;(define x "x")
;(display x)

(define (imprimer-char char n)
  (define (iter i)
    (if (>= i n)
        (void)
        (begin
          (display char)
          (iter (+ i 1)))))
  (iter 0))

;(imprimer-char "x" 5)

(define (losange-iter n)
  (define (iter i somme)
    (if (>= i (- n 1))
        (void)
        (begin
          (imprimer-char " " (/ (- 79 somme) 2))
          (imprimer-char "x" (+ somme 1))
          (newline)
          (iter (+ i 1) (+ somme 2)))))
  (define (iter-rev i somme)
    (if (= i 0)
        (void)
        (begin
          (imprimer-char " " (/ (- 79 (- somme 2) ) 2))
          (imprimer-char "x" (- somme 1))
          (newline)
          (iter-rev (- i 1) (- somme 2)))))
  (iter 0 0)
  (iter-rev n (* n 2)))

;(losange-iter 8)



(define (losange long)
  (cond
    [(not (number? long)) "Donnees invalides"]
    [(< long 1) "Donnees invalides"]
    [(> (* long 2) (/ 79 2)) "Losange est trop grand"]
    [else (losange-iter long)]))
(losange 15)