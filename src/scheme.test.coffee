{compute} = require "./scheme"
tio = require "./tio"

t1 = tio "Compute", (i) ->
	compute i

###
t1 "add simple",
	i: "(+ 4 3)"
	o: "7"

t1 "add double",
	i: "(+ 4 3) (+ 4 5)"
	o: "7 ; 9"

t1 "add multiples",
	i: "(+ 4 2 1)"
	o: "7"

t1 "and simple",
	i: "(and false true)"
	o: "false"

t1 "add nested (lv 1)",
	i: "(+ 4 (+ 2 4) 3)"
	o: "13"

t1 "lambda simple",
	i: "(lambda (x) x)"
	o: "[Function]"

t1 "lambda executed",
	i: "((lambda (x) x) 0)"
	o: "0"
###
t1 "more complex lambda executed",
	i: "((lambda x (* 2 x)) 2)"
	o: "4"
