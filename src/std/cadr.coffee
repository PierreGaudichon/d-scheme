module.exports =

	desc: "TODO. Must not be used."

	test:
		0

	ways: ({Expression, Pair}) ->
		"(car a)":
			parameters:
				0: Pair
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				throw new Error "TODO"
