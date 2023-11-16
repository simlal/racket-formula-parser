#lang racket

; Eval various expressions
(println "first sub-exercice")
(define ref-to-empty `())
; (define empty ())    impossible!
ref-to-empty

(println "second sub-exercice")
(cons `a `(b c))
(define z "a")
(cons z `(b c))

(println "third sub-exercice")
(car `((a) b))
(cdr `((a) b))
(car `((+ 4 1)))
(cdr `((+ 4 1)))

(println "4e sub-ex")
`((+ 4 1))
'(* 4 5)
(* 4 5)
'(un + un = deux)
; 