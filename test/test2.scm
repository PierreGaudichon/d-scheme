
(define map (arr fun)
 (if (nil? arr)
  nil
  (cons
   (fun (car arr))
   (map (cdr arr) fun))))

"Should output a list with the doubles and some nils"
(map (list 1 2 3 "foo" true 4) (lambda (x) (* x 2)))
