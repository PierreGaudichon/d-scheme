module.exports =

	desc: "Is it a char ?"

	test:
		"(char? #\\h)": "true"
		"(char? 1)": "false"
		"(char? 2.5)": "false"
		"(char? nil)": "true"

	ways: ({isType, Char}) ->
		isType "char?", Char
