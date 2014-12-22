{Type} = require "./Type"
{Atom} = require "./Expressions/Atom"

module.exports.Context =
class Context

	# all the function/constants from the standard library and outside
	std: {}
	# all from `define`
	globals: {}
	# all from `lambda`s, `let`s, the newest are first
	stack: []

	constructor: ->
		@std = {}
		@globals = {}
		@stack = []


	# Add in the Std with the `name` and an `Expression`
	addStd: (name, exp, P) ->
		if @std[name]?
			P.error "already std", {name}
		@std[name] = exp

	# Add in the globals variables with the `name` and an `Expression`
	define: (name, exp, P) ->
		if @globals[name]?
			P.error "already global", {name}
		@globals[name] = exp

	push: (a) ->
		@stack.unshift a

	pop: ->
		@stack.shift()

	getOne: (name, P) ->
		for a in @stack
			if a[name]?
				return a[name]
		if @globals[name]?
			return @globals[name]
		if @std[name]?
			return @std[name]

		P.error "not found in variables", {name}
		return Atom.nil()

