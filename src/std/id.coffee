module.exports =

	desc: "Identity : f(x) = x."

	test:
		"(id true)": "true"
		"(id 1)": "1"
		"(id (+ 2 6))": "8"
		"(id (quote a))": "a"

	ways: ({Expression}) ->
		"(boolean? expression)":
			parameters:
				0: Expression
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				ret.init a

