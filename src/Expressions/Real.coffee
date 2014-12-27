{Value} = require "./Value"

module.exports.Real =
class Real extends Value
	type: "Real"

	init: (v) ->
		precision = 10
		@value = Math.floor(v * 10**precision)/10**precision
		return @
