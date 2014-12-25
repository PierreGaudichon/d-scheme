module.exports =

	desc: "Is it a real ?"

	test:
		"(real? 2.5)": "true"
		"(real? true)": "false"
		"(real? 1)": "true"
		"(real? nil)": "true"
		"(real? ())": "true"

	ways: ({Expression, Boolean, Real, Integer, Nil}) ->
		"(cons a b)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof Real) or (a instanceof Integer) or (a instanceof Nil)

