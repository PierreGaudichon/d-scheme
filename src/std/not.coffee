module.exports =
	desc: "Not."
	test:
		"(not true)": "false"
		"(not false)": "true"

	ways: ({Boolean})->
		"(not a)":
			parameters: 0: Boolean
			return: Boolean
			resolve: true

			fun: (ret, [a], P) ->
				ret.init not a.toJS()



