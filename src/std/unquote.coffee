module.exports =

	desc: "The , / unquote statement, not sure it works."

	test:
		"(unquote true)": "nil"
		"(unquote (quote x))": "nil"
		"(unquote (quote (+ 2 3)))": "5"

	ways: ({Expression, Quote}) ->
		"(unquote value)":
			parameters:
				0: Quote
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				ret.init a.resolve(P)
