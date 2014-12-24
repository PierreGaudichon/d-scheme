
(define csum (lambda (k)
 (lambda (x)
  (* k x))))

(define mult2 (csum 2))

(mult2 3) ;; -> 6
