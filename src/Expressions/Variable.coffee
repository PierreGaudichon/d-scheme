{Expression} = require "./Expression"


module.exports.Variable =
class Variable

	constructor: (@name) ->

	resolve: (P) ->
		P.context.getOne @name
