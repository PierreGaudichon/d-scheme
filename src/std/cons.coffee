module.exports =

	desc: "Creates a pair."

	test:
		"(cons 1 2)": "(1 . 2)"
		"(cons 1 (cons 2 3))": "(1 . (2 . 3))"

	ways: ({Expression, Pair}) ->
		"(cons a b)":
			parameters:
				0: Expression
				1: Expression
			return: Pair
			resolve: true

			fun: (ret, args, P) ->
				ret.init args[0], args[1]
