module.exports =
	desc: "And."
	test:
		"(and true false)": "false"
		"(and true true)": "true"

	ways: ({EkE}) ->
		EkE "and", "Boolean", (a, b) -> a and b
