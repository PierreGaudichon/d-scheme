module.exports =

	desc: "Is it a list ?"

	test:
		"(list? (list 1 2 3))": "true"
		"(list? (cons 1 2))": "false"
		"(list? 2.5)": "false"
		"(list? (cons 1 nil)": "true"
		"(list? nil)": "true"

	ways: ({Expression, Boolean, Pair, Nil}) ->
		"(list? expression)":
			parameters:
				0: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				while true
					if a instanceof Nil
						return ret.init true
					else if a instanceof Pair
						a = a.right
					else
						return ret.init false


