module.exports =

	desc: "Cosinus"

	test:
		"(cos 0)": "1"
		"(cos (/ pi 2))": "0"

	ways: ({EtE}) ->
		EtE "cos", Math.cos
