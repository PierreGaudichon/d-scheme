module.exports =

	desc: "Create a function contstant which return the value."

	test:
		"(const true)": "(lambda () true)"
		"((const 2))": "2"
		"(const (quote x))": "(lambda () x)"

	ways: ({Expression, CustomFunction}) ->
		"(const value)":
			parameters:
				0: Expression
			return: CustomFunction
			resolve: true

			fun: (ret, [a], P) ->
				ret.init [], a
