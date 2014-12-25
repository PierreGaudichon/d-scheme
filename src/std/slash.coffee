module.exports =

	name: "/"
	desc: "The standard division. (R x R -> R)"

	test:
		"(/ 2.0 1.0)": "2"
		"(/ 1 2)": "0.5"

	ways: ({Real}) ->
		"(/ a b) ;; b most not be 0.":
			parameters:
				0: Real
				1: Real
			return: Real
			resolve: true

			fun: (ret, [a, b], P) ->
				ret.init a.toJS() / b.toJS()
