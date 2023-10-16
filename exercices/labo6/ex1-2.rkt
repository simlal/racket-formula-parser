#lang racket

;ex1
;f(x, y, z) = x * (x + y) * (x + y + z)

(define (f1 x y z)
  (let
       ([x+y (+ x y)])
    (* x x+y (+ x+y z))))


(define (f1-l x y z)
  ((lambda (x+y) (* x x+y (+ x+y z)))
     (+ x y)))
(printf "(f 2 5 7) = ~a ~n" (f1 2 5 7))
(printf "(f-lambda 2 5 7) = ~a ~n" (f1-l 2 5 7))
     
; ex2
(define (test-let* a)
  (let* ([a a]
         [b (+ a a)]
         [c (+ a b)])
    (list a b c)))
     
(test-let* 2)

(define (test-imbrication-let a)
  (let ([a a])
    (let ([b (+ a a)])
      (let ([c (+ a b)])
        (list a b c)))))
        

(printf "(test-imbrication-let 2) = ~a ~n" (test-imbrication-let 2))

(define (test-let-l a)
  ((lambda (a)
     ((lambda (b)
       ((lambda (c) (list a b c))
         (+ a b)))
      (+ a a)))
   a))
      
(println "(test-let-l 2)")
(test-let-l 2)



