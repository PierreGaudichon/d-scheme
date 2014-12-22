module.exports =
	desc: "Or."
	test: 0

	ways: ({EkE}) ->
		EkE "or", "Boolean", (a, b) -> a or b
