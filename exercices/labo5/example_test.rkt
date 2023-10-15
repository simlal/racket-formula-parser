#lang racket
(require test-engine/racket-tests) ; https://docs.racket-lang.org/test-engine/index.html#%28mod-path._test-engine%2Fracket-tests%29

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
(check-expect (fact 0) 1)
(check-expect (fact 3) 6)
(check-expect (fact 4) 24)
(check-within (sqrt 2) 1.414 0.001)
(check-error (cddr (cons 1 2)))
(check-error (/ 1 0) "/: division by zero")
(check-range (* 2 2) 0 100)
(test)