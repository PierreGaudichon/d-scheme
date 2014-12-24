module.exports =
	desc: "Or."
	test: 0

	ways: ({EkE, Boolean}) ->
		EkE "or", Boolean, (a, b) -> a or b
