{Expression} = require "./Expression"

module.exports.StandardFunction =
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


