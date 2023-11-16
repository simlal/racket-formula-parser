#lang lazy

;ex 3 ordre applicatif
; New definition of a "if-then-else" function
(define (new-if predicate clause-then clause-else)
  (if predicate clause-then clause-else))

(define a 0)
(new-if (zero? a) #t #f) ;; -> #t
(new-if (zero? a)
        (println "a est nul")
        (println "a est non nul")) ;; prints both parts

; En mode applicatif (natif scheme) les arguments sont eval avant l'appel de la fonction.
; C'est pourquoi les 2 prints sont eval

; En mode normal, on ira dans l'ordre exterieur vers interieur et donc
; on evaluerait le (zero? a) en premier et donc seulement la clause-then
; sera eval

(define (p) (p))
(define (test x y)
(if (= x 0)
0
y))
;(test 0 (p))
; appel infini en mode eval pareuses pour la fct