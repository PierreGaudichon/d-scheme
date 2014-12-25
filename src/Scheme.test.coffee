{Scheme} = require "./Scheme"
tio = require "./tio"


programm = new Scheme()
	.std "bin/std/*"


t1 = tio "Interprete", (i) ->
	programm
		.in "str", i
		.parse()
		.lexe()
		.interprete()
		.out "computed", format: "str"

###
t1 "add simple",
	i: "(+ 4 3)"
	o: "7"


t1 "add double",
	i: "(+ 4 3) (+ 4 5)"
	o: "7\n9"

t1 "add multiples",
	i: "(+ 4 2 1)"
	o: "7"

t1 "and simple",
	i: "(and false true)"
	o: "false"

t1 "add nested (lv 1)",
	i: "(+ 4 (+ 2 4) 3)"
	o: "13"

t1 "division simple",
	i: "(/ 1 2)"
	o: "0.5"

t1 "lambda simple",
	i: "(lambda (x) x)"
	o: "(lambda (x) x)"

t1 "lambda executed",
	i: "((lambda (x) x) 0)"
	o: "0"

t1 "more complex lambda executed",
	i: "((lambda (x) (* 2 x)) 2)"
	o: "4"

t1 "more complex lambda executed 2",
	i: "((lambda x (* 2 x)) 2)"
	o: "4"

t1 "if simple",
	i: "(if true 0 1)"
	o: "0"

t1 "even more complex lambda",
	i: "((lambda (b x) (if b x 0)) true 1)"
	o: "1"

t1 "define a constant",
	i: "(define e 2.7183)"
	o: "2.7183"

t1 "define a function",
	i: "(define fun (lambda (x) x))"
	o: "(lambda (x) x)"

t1 "define a function 2",
	i: "(define fun (x) x)"
	o: "(lambda (x) x)"

t1 "define and execute a function",
	i: "(define fun (lambda (x) x)) (fun 2)"
	o: "(lambda (x) x)\n2"

t1 "define and execute a function 2",
	i: "(define fun (lambda (x) x)) (fun 2)"
	o: "(lambda (x) x)\n2"

t1 "define and execute a function 3",
	i: "(define fun (x) (* 2 x)) (fun 3)"
	o: "(lambda (x) (* 2 x))\n6"

t1 "currying",
	i: "(((lambda (x) (lambda (k) (* k x))) 2) 3)"
	o: "6"

t1 "cons simple",
	i: "(cons 1 2)"
	o: "(1 . 2)"

t1 "car simple",
	i: "(car (cons 1 2))"
	o: "1"

t1 "PI",
	i: "pi"
	o: Math.PI.toString()


t1 "nil?",
	i: "(nil? nil)"
	o: "true"

t1 "string 1",
	i: "\"foo\""
	o: "\"foo\""

t1 "string 2",
	i: "(define foo \"foo\")"
	o: "\"foo\""

t1 "char 1",
	i: "#\\a"
	o: "#\\a"
###
