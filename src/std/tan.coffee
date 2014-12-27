module.exports =

	desc: "Tangente."

	test:
		"(tan 0)": "0"
		"(tan (/ pi 4))": "1"

	ways: ({EtE}) ->
		EtE "tan", Math.tan
