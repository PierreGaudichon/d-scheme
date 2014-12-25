module.exports =

	desc: "The basic if / else if / else statement."

	test:
		"(cond ((true 0) (true 1)))": "0"
		"(cond ((false 0) (true 1)))": "1"
		"(cond ((false 0)))": "0"

	ways: ({Expression, Boolean}) ->
		"(cond a)":
			parameters:
				0:
					"...":
						0: Boolean
						1: Expression
			return: Expression
			resolve: false

			fun: (ret, [mol], P) ->
				[list..., last] = mol.list
				for a in list
					if a.list[0].resolve(P).toJS()
						return ret.init a.list[1].resolve(P)
				ret.init last.list[1].resolve(P)
