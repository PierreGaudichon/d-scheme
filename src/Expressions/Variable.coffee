{Atom} = require "./Atom"

module.exports.Variable =
class Variable extends Atom

	name: ""

	init: (@name) ->
		@

	resolve: (P) ->
		@getVariable @name, P

	toString: -> @name

	toJSON: -> {exp: "Variable", @name}
