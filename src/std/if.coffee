module.exports =

	desc: "If."
	test:
		"(if true 0 1)": "0"
		"(if false 0 1)": "1"
		"(if (or true false) (+ 4 2) (* 2 4))": "6"

	ways: ({Expression, Boolean}) ->
		"(if boolean then-expression else-expression)":
			parameters:
				0: Boolean
				1: Expression
				2: Expression
			return: Expression
			resolve: false

			fun: (ret, [a, b, c], P) ->
				if a.resolve(P).toJS()
					ret.init b.resolve P
				else
					ret.init c.resolve P
