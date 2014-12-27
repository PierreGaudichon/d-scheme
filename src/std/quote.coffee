module.exports =

	desc: "The ' / quote statement, not sure it works."

	test:
		"(quote true)": "true"
		"(quote x)": "x"
		"(quote (+ 2 3))": "(+ 2 3)"

	ways: ({Expression, Quote}) ->
		"(quote value)":
			parameters:
				0: Expression
			return: Quote
			resolve: false

			fun: (ret, [a], P) ->
				ret.init a
