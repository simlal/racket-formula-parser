# Overview
Formula parser in Racket using binary trees

## Source the parser
In the same directory, import the parser module in your Racket file:
```racket 
(require "parser.rkt")
```

## Example usage
```racket
(define exp1 (creer-formule `(((a + b) * 3) - 4)) )
(define exp2 (creer-formule `(a + (b * 3)) ))
```

Define the environment:
```racket
(define env (lier `a
                    10
                    (lier `b
                        20
                        (lier `+
                            +
                            (lier `-
                                -
                                (lier `*
                                        *
                                        (lier `/
                                            /
                                            (creer-env))))))))
```

To parse the expression:

```racket
(display (format "(calculer exp1 env):\n~a\n" (calculer exp1 env)))
(display (format "(calculer exp1 env):\n~a\n" (calculer exp2 env)))
```




