module.exports =

	desc: "Extract the second/right from a pair."

	test:
		"(cdr (cons 1 2))": "2"
		"(cdr (car (cons (cons 1 2) 3)))": "2"

	ways: ({Expression, Pair}) ->
		"(cdr a)":
			parameters:
				0: Pair
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				ret.init a.right
