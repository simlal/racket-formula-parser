#lang racket

; question 1 - notation préfixée
(displayln "question I")
; exp1 : 1 point  mais 1/2 point si le + ne prend pas 3 arguments mais est séparée par ()
;(+ 45 (* 3 10) (/ 5 4))
;exp2 : 1 point
;(/ 1 (sin (+ (* 4 12) 25)))

(newline)
(displayln "question II")
; 1 point
(define a (/ (+ 20 30) (- 13 (* 2 9))))
a
(define Liste '(17 25 (a (b)) 18 32 (x (y))))
; 1 point
(cadr Liste)
; 1 point
(caddr Liste)
; 1 point
(cdaddr Liste)

; 1 point
((lambda(x)
   (cond [(= (remainder x 3) 0) (+ x 100)]
         [(= (remainder x 3) 1) (* x 2)]
         [else x]))
 13)


; 1 point
(let ([u (cons 1 2)]) (eq? u (cons 1 2)))

; 2 points
; donne 2400, si oubli de let* et remplacé par un let donne 840
(define dix 10)
(define (etrange x a)
  (let* ([x (* dix a)] [y (- x 20)])
    (+ (* x x)(* x y))))
(etrange 1 4)

; 1 point
(define nombres-pairs (list 4 2 10))
(define nombres-impairs (list 5 31 11))
(list nombres-pairs nombres-impairs)


(define (mystere L)
  (if (null? L)
      null
      (let([doublet (car L)])
          (cons (cond
                  [(equal? (car doublet) 'd) (* 2 (cdr doublet))]
                  [(equal? (car doublet) 't) (* 3 (cdr doublet))]
                  [(equal? (car doublet) 'q) (* 4 (cdr doublet))]
                  [else (cdr doublet)])
                (mystere (cdr L))))))
; 1 point
(mystere '((t . 10)))
; 1 point
(mystere '((d . 2) (d . 4) (t . 3) (q . 5) (u . 8)))

; 1 point
(map even? '(1 2 3 4 5 6))
; 1 point
(filter even? '(1 2 3 4 5 6))
(displayln "fin question II")
(newline)



;;;;;;

;;; question III récursivité
;;;
(displayln "Question III")
;;; question III.1  - récursif
;;;
(displayln "Question III.1 s-inv-r")
(define (s-inv-r n)
  (if (= n 1)
      1
      (+ (s-inv-r (- n 1)) (/ 1 n))))
(s-inv-r 2)

;;; question III.1  - tail récursif
;;;
(displayln "Question III.2 s-inv-i")
(define (s-inv-i n)
  (define (iter i res)
    (if (> i n)
      res
      (iter (+ i 1) (+ res (/ 1 i)))))
  (iter 1 0))
(s-inv-i 2)
(newline)


;;;
(displayln "Question III.3 s-inv  avec programmation par séquences")
(define (accumuler comb fonct val-init a b)
  (define (interne i)
    (if  (> i b)
         val-init
         (comb (fonct i) (interne (+ i 1)))))
  (interne a))

(define (s-inv n)
  (accumuler + (lambda(i) (/ 1 i)) 0 1 n))

(s-inv 5)
(newline)


;;;;;;;;;;;
;;; Question IV  : structure de données polynômes
;;;;;;;;;

;(define (degre-poly L-coef)
  ;;;;; le premier coefficient non nul en partant par la fin
;  )
(displayln "Question IV")

(displayln "Question IV. 1.a  Énumérer les entiers croissants")

(define (enumerer-entiers-croiss a b)
  (if (> a b)
      null
      (cons a (enumerer-entiers-croiss (+ a 1) b))))
(enumerer-entiers-croiss 1 10)

(displayln "Question IV. 1.b  Énumérer les Doublets : poly-doublet")
  
(define (poly-doublet  L-coeff)
  (let ([L-entiers (enumerer-entiers-croiss 1 (length L-coeff))])
    (map cons L-entiers L-coeff)))

(poly-doublet '(8 10 20 30))
(poly-doublet '(8 5 0 12 1))

(displayln "Question IV. 1.c  Fonction f-poly ")
;;;  la fonction poly-doublet peut-être recopiée dans la fonction f-poly
;;;  ou ellle peut être réécrite
(define (f-poly L-coeff)
  (let ([L-entiers (enumerer-entiers-croiss 0  (- (length L-coeff) 1))])
   (lambda(x)
     (apply + (map (lambda(i) (* (cdr i) (expt x (car i))))
                    (map cons L-entiers L-coeff)))))) 

((f-poly '(8 10)) 1)
((f-poly '(1 0 0 0)) 2) 
((f-poly '(1 0 0 100)) 2)
((f-poly '(1 0 10 100)) 2)
((f-poly '(8 5 0 12 1)) 2)



(displayln "Question IV.2  degre poly ")
(define (degre-poly L-coeff)
  (define (iter L i d)
    (if (null? L)
        d
        (if (= (car L) 0)
            (iter (cdr L) (+ i 1) d)
            (iter (cdr L) (+ i 1) i ))))
  (iter L-coeff 0 0))

(displayln "degre poly")
(degre-poly '(8 10))
(degre-poly '(1 0 0 0))
(degre-poly '(1 0 0 100))


(newline)
(displayln "Question IV.3  addition de 2 polynômes ")

(displayln "Question IV.3.a  addition de 2 polynômes programmation récursive ")
(define (add-poly-r L1c L2c)
    (cond [(null? L1c) L2c]
          [(null? L2c) L1c]
          [else (cons (+ (car L1c) (car L2c))
                      (add-poly-r (cdr L1c) (cdr L2c)))]))

(add-poly-r '(1 2 3 4) '(1 0 0 10))
(add-poly-r '( 1 2 3 4) '(0 12))
(add-poly-r  '(0 12) '( 1 2 3 4))



(displayln "Question IV.3.b  addition de 2 polynômes  programmation par séquences")
(define (liste-n  i c)
  (if (= i 0)
      null
      (cons c (liste-n (- i 1) c))))
(liste-n  3 0)

(define (add-poly P1 P2)
  (let ([l1 (length P1)] [l2 (length P2)])
    (cond [(> l1 l2) (map + P1 (append P2 (liste-n (- l1 l2) 0)))]
          [(< l1 l2) (map + (append P1 (liste-n (- l2 l1) 0)) P2)]
          [else (map + P1 P2)])))  ; les 2 listes sont de longueur égales
         
(add-poly '(1 2 3 4) '(1 0 0 10))
(add-poly '( 1 2 3 4) '(0 12))
(add-poly  '(0 12) '( 1 2 3 4))


(newline)
(displayln "Question IV.4 implantation sans 0 ")
(define (poly-doublet-sans0 L-coeff)
  (let ([L-entiers (enumerer-entiers-croiss 1 (length L-coeff))])
    (filter (lambda(i) (not (zero? (cdr i))))
            (map cons L-entiers L-coeff))))
(poly-doublet-sans0 '(1 0 0 0))

(poly-doublet-sans0 '(1 0 0 100))

 
  


                  
    
  