module.exports =

	desc: "Is it nothing ?"

	test:
		"(nil? nil)": "true"
		"(nil? true)": "false"
		"(nil? 2.5)": "false"

	ways: ({Expression, Boolean, Nil}) ->
		"(cons a b)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init a instanceof Nil

