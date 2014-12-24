{Atom} = require "./Atom"


module.exports.Pair =
class Pair extends Atom

	left: "Expression"
	right: "Expression"


	init: (@left, @right) -> @


	resolve: -> @

	toString: ->
		"(#{@left} . #{@right})"

	toJSON: -> {exp: "Pair", left: @left.toJSON(), right: @right.toJSON()}
