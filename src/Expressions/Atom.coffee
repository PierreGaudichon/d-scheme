{Expression} = require "./Expression"


module.exports.Atom =
class Atom


	type: ""
	value: ""


	constructor: (type, value) ->
		@type = type
		@value = value


	evaluate: -> @
