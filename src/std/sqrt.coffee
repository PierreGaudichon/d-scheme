module.exports =

	desc: "Square root."

	test:
		"(sqrt 0)": "0"
		"(sqrt 1)": "1"
		"(sqrt 9)": "3"
		"(sqrt -1)": "NaN" # need to throw an error

	ways: ({EtE, Real}) ->
		EtE "sqrt", Real, Math.sqrt
