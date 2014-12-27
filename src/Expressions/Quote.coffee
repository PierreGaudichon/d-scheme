{Atom} = require "./Atom"

module.exports.Quote =
class Quote extends Atom

	expression: "js"

	init: (@expression) -> @

	resolve: (P) ->
		@expression.resolve(P).attach @context

	toJS: -> @expression.toJS()

	toString: -> @expression.toString()

	toJSON: -> {exp: "Quote", expression: @expression.toJSON()}


