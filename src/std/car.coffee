module.exports =

	desc: "Extract the first/left from a pair."

	test:
		"(car (cons 1 2))": "1"
		"(car (car (cons (cons 1 2) 3)))": "1"

	ways: ({Expression, Pair}) ->
		"(car a)":
			parameters:
				0: Pair
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				ret.init a.left
