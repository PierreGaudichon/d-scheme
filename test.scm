;; Add `add` into the context with a `Function` as a value
(define add (lambda (x)
	(+ x 2)))
=> Function

(define map2 map)
=> Function

(define arr (list 0 1 2))
=> List

(map2 arr add)
=> List

(add 2 3)
=> Integer
