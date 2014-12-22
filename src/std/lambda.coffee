module.exports =

	desc: "The function which creates functions."
	test:
		"(lambda (x) x)": "[Function]"
		"((lambda (x) x) 0)": "0"
		"((lambda x (* 2 x)) 2)": "4"

	ways: ({CustomFunction}) ->
		"(lambda (x) x)":
			parameters:
				0: "...": "Variable"
				1: "Expression"
			return: "Function"

			fun: (args, P) ->
				params = []
				console.log args
				for v in args[0].list
					params.push v.value
				body = args[1]
				new CustomFunction params, body


		"(lambda x x)":
			parameters:
				0: "Variable"
				1: "Expression"
			return: "Function"

			fun: (args, P) ->
				params = [args[0].value]
				body = args[1]
				new CustomFunction params, body
