module.exports =

	desc: "Add some numbers."
	test:
		"(+ 4 5)": "9"
		"(+ 1 2 3)": "6"
		"(+ 1 2 3 4 56 7 8 9)": "90"
		"(+ (+ 1 2) 3)": "6"

	ways: ({EkE, Real}) ->
		EkE "+", Real, (a, b) -> a + b
