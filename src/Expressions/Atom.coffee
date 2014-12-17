{Expression} = require "./Expression"


module.exports.Atom =
class Atom


	type: ""
	value: ""


	constructor: (type, value) ->
		@type = type
		@value = value


	evaluate: -> @

	resolve: ->
		if @type is "Variable"
			P.context.getOne @name
		else
			@

	toString: -> @value
