{Expression} = require "./Expression"
{SFunction} = require "./SFunction"
{Nil} = require "./Nil"
{cl} = require "./../cl"


module.exports.Molecule =
class Molecule extends Expression

	list: []


	init: (@list) ->
		@


	resolve: (P) ->
		if @list.length is 0
			return new Nil(@parent).attach(@context)
		first = @list[0].resolve P
		lasts = @list[1..]

		if first instanceof SFunction
			evaluated = first.evaluate lasts, P
			evaluated.attach @context
			return evaluated
		if first instanceof Nil
			return first.attach @context
		else
			P.error "not function"
			return new Nil(@parent).attach @context


	toString: ->
		"(#{(e.toString() for e in @list).join " "})"

	toJSON: -> {exp: "Molecule", list: (exp.toJSON() for exp in @list)}
