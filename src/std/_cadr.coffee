module.exports =

	desc: "TODO. Must not be used."

	test:
		"(card (list 1 2 3))": "(car (cdr (list 1 2 3)))"

	special: /^c[ad]{2,}r$/

	ways: ({Expression, Pair}) ->
		"(car a)":
			parameters:
				0: Pair
			return: Expression
			resolve: true

			fun: (ret, name, [a], P) ->
				throw new Error "TODO"
