{cl} = require "./../cl"


module.exports =

	desc: "The function that put some variables in the global scope."
	test:
		"(define pi 3.14)": "3.14"
		"(define id (lambda (x) x))": "(lambda (x) x)"
		"(define ugly (bool a) (if bool a 0))":
			"(lambda (bool a) (if bool a 0))"
		"((define ugly2 (bool a) (if bool a 0)) true 1)": "1"

		#"(define (ugly3 x) x)": "(lambda (x) x)"

	ways: ({Variable, Expression, CustomFunction}) ->
		"(define name (arg ...) body)":
			parameters:
				0: Variable
				1: "...": Variable
				2: Variable
			return: CustomFunction
			resolve: false

			fun: (ret, args, P) ->
				params = []
				for v in args[1].list
					params.push v.name
				body = args[2]
				f = ret.init params, body
				ret.define args[0].name, f
				return f


		"(define name value)":
			parameters:
				0: Variable
				1: Expression
			return: Expression
			resolve: false

			fun: (ret, args, P) ->
				ret.define args[0].name, args[1].resolve(P)
				return args[1]

		###
		"(define (name args ...) body)":
			parameters:
				0: "...": "...": Variable
				1: Expression
			return: Expression
			resolve: false

			fun: (ret, [a, body], P) ->
				console.log "HERE"
				[name, args...] = a.list
				params = []
				for v in args.list
					params.push v.name
				body = args[1]
				f = ret.init params, body
				ret.define name.name, f
				return f
		###

