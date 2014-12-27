module.exports =

	desc: "Sinus"

	test:
		"(sin 0)": "0"
		"(sin (/ pi 2))": "1"

	ways: ({EtE}) ->
		EtE "sin", Math.sin
