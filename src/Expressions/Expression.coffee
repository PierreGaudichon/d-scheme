
module.exports.Expression =
class Expression

	context: {}
	parent: {}

	constructor: (parent) ->
		@parent = parent
		@context = {}

	init: (v) ->
		v.attach @context
		return v


	attach: (a) ->
		for name, value of a
			@context[name] = value
		return @


	define: (name, value) ->
		@parent.define name, value
		return @


	getVariable: (name, P) ->
		if @context[name]?
			@context[name]
		else
			@parent.getVariable name, P
















