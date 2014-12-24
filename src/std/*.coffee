module.exports =

	desc: "Multiply some numbers."
	test:
		"(* 4 5)": "20"
		"(* 1 2 3)": "6"
		"(* 1 2 3 4 56 7 8 9)": "677376"
		"(* (* 1 2) 3)": "6"

	ways: ({EkE, Integer}) ->
		EkE "*", Integer, (a, b) -> a * b
