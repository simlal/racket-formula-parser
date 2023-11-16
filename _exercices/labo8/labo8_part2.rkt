#lang racket

(define (make-account my-balance)
    (define (balance)  my-balance)
    (define (withdraw amount)
        (if (>=  my-balance amount)
            (begin (set!  my-balance (-  my-balance amount))
                    my-balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set!  my-balance (+  my-balance amount))
            my-balance)
    (define (dispatch m)
        (cond 
            [(eq? m 'balance) balance]
            [(eq? m 'withdraw) withdraw]
            [(eq? m 'deposit) deposit]
            [(eq? m `payment) payment]
            [else (error "Unknown request: MAKE-ACCOUNT" m)]))
    (define (payment amount account)
        (withdraw amount)
        ((account `deposit) amount))
    dispatch)

;;; test ex1 ;;;
(define compte1 (make-account 100))
(display "((compte1 `balance))\n")
((compte1 `balance))
(display "((compte1 `withdraw) 50)\n")
((compte1 `withdraw) 50)

(define compte2 (make-account 200))
(display "((compte1 `payment) 20 compte2)\n")
((compte1 `payment) 20 compte2)
((compte1 `balance))
((compte2 `balance))

;;; ex2;;;
;TODO IMPLEMENT WITHOUT 
;* DONT COPY PASTPY PASTE
(define (make-account-secure my-balance my-code)
    (let [(account (make-account my-balance))
          (code my-code)]
        (define (modify-code new-code)
            (set! code new-code)
                new-code)
        (lambda (m c)
            (if (eq? c code)
                (cond
                    [(eq? m 'modify-code) modify-code]
                    [else (account m)])
                "Incorrect code."))))

(define compte3 (make-account-secure 300 "good"))
(display "((compte3 `balance 'good'))\n")
((compte3 `balance "good"))
(display "((compte3 `withdraw 'good') 50)\n")
((compte3 `withdraw "good") 50)

; (display "((compte3 `balance 'wrong'))\n")
; ((compte3 `balance "wrong"))

((compte3 `modify-code "good") "newgood")
((compte3 `balance "newgood"))




