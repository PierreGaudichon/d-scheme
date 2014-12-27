(define csum (lambda (k)
 (lambda (x)
  (* k x))))

(define mult2 (csum 2))

"Should output 6."
(mult2 3)


