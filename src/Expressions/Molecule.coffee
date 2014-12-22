{Expression} = require "./Expression"
{Function} = require "./Function"
{clone} = require "lodash"


module.exports.Molecule =
class Molecule extends Expression

	type: "Molecule"
	list: []

	constructor: (list) ->
		@list = list


	resolve: (P) ->
		first = @list[0].resolve P
		lasts = @list[1..]

		if first instanceof Function
			return first.evaluate lasts, P
		else
			P.error "not function"


	evaluate: (args, P) -> @


	toString: ->
		"(#{(e.toString() for e in @list).join " "})"


