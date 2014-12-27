module.exports =

	desc: "Is it an integer ?"

	test:
		"(integer? 1)": "true"
		"(integer? true)": "false"
		"(integer? 2.5)": "false"
		"(integer? nil)": "true"

	ways: ({isType, Integer}) ->
		isType "integer?", Integer

