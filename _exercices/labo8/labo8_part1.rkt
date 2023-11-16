#lang racket

;;; ex 1-3 fibo ;;;

(require racket/trace)

(define (fib-r n)
    (cond
        [(eq? 0 n) 0]
        [(eq? 1 n) 1]
        [(+ (fib-r (- n 1)) (fib-r (- n 2)))]))
; (define fibr-start (current-seconds))
; (define fibr-end (current-seconds))
; (display "time fib-r: ~a" (- fibr-end fibr-start))


(define (fib-i n)
  (define (iter a b i)
    (if (> i n)
        a
        (iter b (+ a b) (+ i 1))))
  (iter 0 1 1))

; (trace fib-r)
; (fib-r 5)
; (untrace)
; (trace fib-i)
; (fib-i 50)
; (untrace)

;;; ex 4 ;;;
(define a 5)
(define b 10)
(define (f)
    (+ a b))
(f)

;;;; ex5 ;;;;
(define (g)
    (let
        ([a 5]
        [b 10])
    (+ a b)))
(g)

;;; ex6 ;;;

; b = (+ 1 10)
; a = 5
; (+a b ) = 16
(let ((a 1))
(let ((f (lambda(x)
(let ((b (+ a x))
(a 5))
(+ a b)))))
(f 10)))