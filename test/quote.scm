
"Should output a."
(quote a)
"Should output (+ 1 2)."
(if false (quote yes) '(+ 1 2))
"Should output 6."
((lambda (op) (op 4 2)) '+)


(define human (height weigh say) unquote)

(define jon (human
 175
 73
 (const "lol")))

"Should output 175 twice."
(jon (quote height))
(jon 'height)

"Should output lol."
((jon 'say))
