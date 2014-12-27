module.exports =

	desc: "Create some variables into a new context."
	test:
		"(let ((a 4)) a)": "4"
		"(let ((a 4) (b true)) (if b a 0))": "4"
		"(let ((k 2) (fun +)) (fun k 2))": "4"

	ways: ({CustomFunction, Variable, Expression}) ->
		"(let ((variable value) ...) body)":
			parameters:
				0: "...":
					0: Variable
					1: Expression
				1: Expression
			return: Expression
			resolve: false

			fun: (ret, [params, exp], P) ->
				p = {}
				for i in params.list
					p[i.list[0].name] = i.list[1].resolve P
				exp.attach p
				ret.init exp.resolve P
