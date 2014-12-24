module.exports =

	desc: "Substract some numbers."
	test:
		"(- 4 5)": "-1"
		"(- 3 2 1)": "0"

	ways: ({EkE, Integer}) ->
		EkE "-", Integer, (a, b) -> a - b
