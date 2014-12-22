{Expression} = require "./Expression"


module.exports.Atom =
class Atom extends Expression


	type: ""
	value: ""


	constructor: (type, value) ->
		@type = type
		@value = value


	evaluate: -> @

	resolve: (P) ->
		if @type is "Variable"
			P.context.getOne @value, P
		else
			@

	toString: -> @value

	toJS: -> @value

	@nil: -> new Atom "Null", "nil"
