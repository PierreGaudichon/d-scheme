{Expression} = require "./Expression"
{Nil} = require "./Nil"


module.exports.Root =
class Root extends Expression

	list: []

	init: ->
		@parent = null
		@list = []
		return @


	getVariable: (name, P) ->
		if @context[name]?
			@context[name]
		else
			P.error "not found in variables", name: name
			new Nil null

	define: (name, value) ->
		@context[name] = value

	resolve: (P) ->
		root = new Root null
		root.init()
		for exp in @list
			root.list.push exp.resolve P
		root.attach @context
		return root

	toString: ->
		(exp.toString() for exp in @list).join "\n"

	toJSON: -> {exp: "Root", list: (exp.toJSON() for exp in @list)}
