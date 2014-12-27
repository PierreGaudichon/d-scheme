{Parser} = require "./Parser"
{tio} = require "./tio"

toList = (list) ->
	(l.value for l in list)

t = tio "Parser.toList", (i) ->
	toList new Parser(i).parse().out()

t "small",
	i: "(+ 4 2)"
	o: ["(", "+", "4", "2", ")"]

t "big",
	i: "(*(+ 4 2) 2)"
	o: ["(", "*", "(", "+", "4", "2", ")", "2", ")"]

t "lambda",
	i: "(lambda (x) x)"
	o: ["(", "lambda", "(", "x", ")", "x", ")"]
