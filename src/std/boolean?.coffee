module.exports =

	desc: "Is it a boolean ?"

	test:
		"(boolean? true)": "true"
		"(boolean? 1)": "false"
		"(boolean? 2.5)": "false"
		"(boolean? nil)": "true"

	ways: ({Expression, Boolean, Nil}) ->
		"(cons a b)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof Boolean) or (a instanceof Nil)

