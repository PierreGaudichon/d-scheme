{Atom} = require "./Atom"

module.exports.Value =
class Value extends Atom

	type: ""
	value: "js"

	init: (@value) -> @

	resolve: -> @

	toJS: -> @value

	toString: -> @value.toString()

	toJSON: -> {exp: @type, @value}


