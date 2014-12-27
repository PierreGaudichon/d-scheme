module.exports =

	desc: "Is it an integer ?"

	test:
		"(integer? 1)": "true"
		"(integer? true)": "false"
		"(integer? 2.5)": "false"
		"(integer? nil)": "true"

	ways: ({Expression, Boolean, Integer, Nil}) ->
		"(integer? expression)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof Integer) or (a instanceof Nil)

