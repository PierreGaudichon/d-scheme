module.exports =

	desc: "Print the input to stdout, use the JS function `console.log` internally. The second parameter decide if the Expression is printed."

	#test:
		# "(print 0)": "0"
		# "(print 0 true)": "0"
		#"(define a 4) (print a false)": "4\n4"

	ways: ({Expression, Boolean}) ->
		"(print a)":
			parameters:
				0: Expression
			return: Expression
			resolve: true

			fun: (ret, [a], P) ->
				console.log a.toString()
				ret.init a

		"(print a b)":
			parameters:
				0: Expression
				1: Boolean
			return: Expression
			resolve: true

			fun: (ret, [a, b], P) ->
				if b.resolve(P).toJS()
					console.log a.toString()
				ret.init a
