module.exports =

	desc: "Is it a string ?"

	test:
		"(string? \"\")": "true"
		"(string? \"foo\")": "true"
		"(string? true)": "false"
		"(string? 2.5)": "false"
		"(string? nil)": "true"

	ways: ({isType, String}) ->
		isType "string?", String

