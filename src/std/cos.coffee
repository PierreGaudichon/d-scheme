module.exports =

	desc: "Cosinus"

	test:
		"(cos 0)": "1"
		"(cos (/ pi 2))": "0"

	ways: ({EtE, Real}) ->
		EtE "cos", Real, Math.cos
