module.exports = ({Klass}) ->


	"(lambda (x) x)":
		parameters:
			0: "Molecule": "Variable..."
			1: "Expression"
		return: "Function"

		fun: (args, P) ->
			params = []
			for v in args[0].list
				params.push v.name
			body = args[1].resolve(P)
			Klass.CustomFunction params, body


	"(lambda x x)":
		parameters:
			0: "Variable"
			1: "Expression"
		return: "Function"

		fun: (args, P) ->
			params = [args[0].name]
			body = args[1].resolve(P)
			Klass.CustomFunction params, body
