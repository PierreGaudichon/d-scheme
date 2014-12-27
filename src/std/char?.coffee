module.exports =

	desc: "Is it a char ?"

	test:
		"(char? #\\h)": "true"
		"(char? 1)": "false"
		"(char? 2.5)": "false"
		"(char? nil)": "true"

	ways: ({Expression, Char, Boolean, Nil}) ->
		"(char? expression)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof Char) or (a instanceof Nil)

