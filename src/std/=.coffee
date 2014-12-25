{isEqual} = require "lodash"

module.exports =

	desc: "Test the equality between two variables."

	test:
		"(= true false)": "false"
		"(= true true)": "true"
		"(= 1 2)": "false"
		"(= (list 1 2) (cons 1 (cons 2 nil)))": "true"
		"(= nil 4)": "false"

	ways: ({Boolean, Expression}) ->
		"(= a b ...)":
			parameters:
				0: Expression
				1: Expression
			return: Boolean
			resolve: true

			fun: (ret, [a, b], P) ->
				ret.init isEqual a.toJSON(), b.toJSON()

