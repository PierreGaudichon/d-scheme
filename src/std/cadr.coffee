module.exports =

	desc: "The composition of some `car`s and `cdr`s. `cdadr = cdr o car o cdr`."

	test:
		"(cadr (list 1 2 3))": "2"
		"(car (cdr (list 1 2 3)))": "2"
		"(cadddr (list 1 2 3 4))": "4"

	special: /^c[ad]{2,}r$/


	ways: ({Expression, Pair, Nil}) ->
		"(cadr pair)":
			parameters:
				0: Pair
			return: Expression
			resolve: true

			fun: (ret, name, [a], P) ->
				name = name.split("").reverse().join("")[1..-2]
				for c in name
					if a instanceof Pair
						if c is "a"
							a = a.left
						else if c is "d"
							a = a.right
					else
						return new Nil null

				return ret.init a
