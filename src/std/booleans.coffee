

module.exports.or = ({EkE}) ->
	EkE "or", "Boolean", (a, b) -> a or b


module.exports.and = ({EkE}) ->
	EkE "and", "Boolean", (a, b) -> a and b


module.exports.not = ->
	"(not a)":
		parameter: "Boolean"
		return: "Boolean"
		fun: (args, P) ->
			not a



