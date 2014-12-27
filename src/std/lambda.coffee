{cl} = require "./../cl"

module.exports =

	desc: "The function which creates functions."
	test:
		"(lambda (x) x)": "(lambda (x) x)"
		"((lambda (x) x) 0)": "0"
		"((lambda (x) (* 2 x)) 2)": "4"
		"((lambda x (* 2 x)) 2)": "4"
		"((lambda (b x) (if b x 0)) true 1)": "1"
		"(((lambda (x) (lambda (k) (* k x))) 2) 3)": "6"
		"((lambda (x) (* 2 x)) 2) (+ 0 x)": "4\nnil"

	ways: ({CustomFunction, Variable, Expression}) ->
		"(lambda (x) x)":
			parameters:
				0: "...": Variable
				1: Expression
			return: CustomFunction
			resolve: false

			fun: (ret, args, P) ->
				params = []
				for v in args[0].list
					params.push v.name
				body = args[1]
				ret.init params, body


		"(lambda x x)":
			parameters:
				0: Variable
				1: Expression
			return: CustomFunction
			resolve: false

			fun: (ret, args, P) ->
				params = [args[0].name]
				body = args[1]
				ret.init params, body
