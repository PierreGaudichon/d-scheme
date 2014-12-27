module.exports =

	desc: "Is it a pair ?"

	test:
		"(pair? (cons 1 2))": "true"
		"(pair? true)": "false"
		"(pair? (list 1))": "true"
		"(pair? nil)": "true"

	ways: ({Expression, Boolean, Pair, Nil}) ->
		"(pair? expression)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof Pair) or (a instanceof Nil)

