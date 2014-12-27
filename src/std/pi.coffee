module.exports =
	desc: "Pi, π, 3.14"
	test:
		"pi": Math.PI.toString()[0..11]
		"(* 2 pi)": (2*Math.PI).toString()[0..10]

	ways: ({Real}) ->
		type: Real
		value: Math.PI
