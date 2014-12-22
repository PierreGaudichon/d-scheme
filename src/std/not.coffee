module.exports =
	desc: "Not."
	test:
		"(not true)": "false"
		"(not false)": "true"

	ways: ->
		"(not a)":
			parameter: 0: "Boolean"
			return: "Boolean"
			fun: (args, P) ->
				not a



