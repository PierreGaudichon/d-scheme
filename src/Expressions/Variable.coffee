{Atom} = require "./Atom"

module.exports.Variable =
class Variable extends Atom

	name: ""

	init: (@name) ->
		@

	resolve: (P) ->
		@getVariable(@name, P).resolve(P).attach @context

	toString: -> @name

	toJSON: -> {exp: "Variable", @name}
