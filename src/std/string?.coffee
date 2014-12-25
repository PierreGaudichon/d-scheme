module.exports =

	desc: "Is it a string ?"

	test:
		"(string? \"\")": "true"
		"(string? \"foo\")": "true"
		"(string? true)": "false"
		"(string? 2.5)": "false"
		"(string? nil)": "true"

	ways: ({Expression, Boolean, String, Nil}) ->
		"(cons a b)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init (a instanceof String) or (a instanceof Nil)

