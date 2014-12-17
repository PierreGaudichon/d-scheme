{Function} = require "./Function"
{Type} = require "./../Type"

module.exports.StandardFunction =
class StandardFunction extends Function

	parameters: []
	return: ""
	fun: ->

	constructor: (d) ->
		@parameters = d.parameters
		@return = d.return
		@fun = d.fun


	# TODO : tests types against @parameters
	evaluate: (args, P) ->
		Type[@return] @fun args, P


