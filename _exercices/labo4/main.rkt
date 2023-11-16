#lang racket

; Ex1 fct de lissage

(define (lissage f dx)
    (lambda (x) 
        (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

; liste nb
(define listex (list 1 2 3 4 5 6 7 8 9 10))

; fct lineaire simple
(define (carre x) (* x x))

; accumuler
(define (accumuler liste fct)
    (cond
        [(null? liste) '()]
        [else (cons (if (procedure? (fct (car liste)))
                       ((fct (car liste)))
                       (fct (car liste)))
                    (accumuler (cdr liste) fct))]))


; (accumuler listex carre)
; (accumuler listex (lissage carre 2.0))

; ex2: enumeration nb (version recursive)
(define (enumerer-rec a b)
    (if (> a b) 
        `()
        (cons a (enumerer-rec (+ 1 a) b))))

; (enumerer-rec 2 7)

; ex3 enum nb (version tail-rec)
(define (enumerer-tailrec a b)
    (define (iter-enum cpt liste)
        (if (> cpt (- b a))
            (reverse liste)
            (iter-enum (+ 1 cpt) (cons (+ a cpt) liste))))
    (iter-enum 0 `()))
; (enumerer-tailrec 2 7)

; ex4 enum diviseurs entier
(define (diviseur n)
    (define (iter-div liste)
        (cond
            [(null? liste) liste]
            [(= 0 (remainder n (car liste))) (cons (car liste) (iter-div (cdr liste)))]
            [else (iter-div (cdr liste))]))
    (iter-div (enumerer-rec 1 (- n 1))))
; autre facon
; (define (diviseur n)
;   (define (iter i)
;     (if (> i (- n 1))
;         '()
;         (if (= (remainder n i) 0)
;             (cons i (iter (+ i 1)))
;             (iter (+ i 1)))))
;   (iter 1))

; ex5: nb premier
(define (premier? n)
    (if (> (length (diviseur n)) 1)
        #t
        #f))
; (premier? 25)

; ex6: traduction
(define testdico `((un . one) (deux . two) (trois . three)))
(define testexp `(un + deux = trois))
(define (value key  alist)
    (cond
        [(null? alist) `()]
        [(eq? key (caar alist)) (cdar alist)]
        [else (value key (cdr alist))]))
(define (subliste dico expr)
    (if (null? expr)
        `()
        (cons 
            (if (not (null? (value (car expr) dico)))
                (value (car expr) dico)
                (car expr))
            (subliste dico (cdr expr)))))

; (subliste testdico testexp)

; ex7 derivation symbolique
(define (variable? x) 
   (symbol? x))
(define (faire-exposant u n)
    (define (iter-i i res)
        (if (= i n)
            res
            (iter-i (+ i 1) (* res u))))
    (iter-i 1 u))

(define (exposant? exp)
    (and
        (list? exp)
        (= 3 (length exp))
        (equal? (car exp) `**)))

(define (base exp)
    (if (exposant? exp)
        (cadr exp)
        "can't find base"))

(define (exposant exp)
    (if (exposant? exp)
        (caddr exp)
        "can't find exp"))


(define (deriv expr x)
  (cond
    [(number? expr) 0]
    [(variable? expr) (if (eq? expr x) 1 0)]
    [(exposant? expr)
     (if (number? (exposant expr))
        (cond
            [(= 0 (exposant expr)) 1]
            [(= 1 (exposant expr)) `(deriv ,x ,(base expr))]
            [else `(* ,(exposant expr) (** ,(base expr) ,(- (exposant expr) 1)))])
        `(* ,(exposant expr) (** ,(base expr) '(- ,(exposant expr) 1))))]))


(deriv `(** x n) `x)

