{Expression} = require "./Expression"

module.exports.Molecule =
class Molecule extends Expression

	list: []

	constructor: (list) ->
		@list = list


	resolve: (P) ->
		first = @list.shift().resolve P
		last = @list

		if first instanceof Function
			return first.evaluate last, P
		else
			P.errors.send "Try to evaluate a non function value."


	evaluate: (args, P) -> @

	toString: ->
		"(#{(e.toString() for e in @list).join " "})"


