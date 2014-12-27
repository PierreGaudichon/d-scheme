module.exports =

	desc: "Is it a pair ?"

	test:
		"(pair? (cons 1 2))": "true"
		"(pair? true)": "false"
		"(pair? (list 1))": "true"
		"(pair? nil)": "true"

	ways: ({isType, Pair}) ->
		isType "Pair?", Pair

