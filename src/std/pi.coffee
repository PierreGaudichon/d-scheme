module.exports =
	desc: "Pi, π, 3.14"
	test:
		"pi": Math.PI.toString()
		"(* 2 pi)": (2*Math.PI).toString()

	ways: ({Real}) ->
		type: Real
		value: Math.PI
