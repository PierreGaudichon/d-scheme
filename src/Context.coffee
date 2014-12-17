{Type} = require "./Type"

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


	addStd: (d, P) ->
		if @std[d.name]?
			P.errors.send "Cant add #{d.name} the std, already exists."
		else
			@std[name] = Type.fromStd d

	define: (name, exp) ->
		if @globals[name]?
			P.errors.tell "#{name} in globals will be overwriten."
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
		P.errors.send "#{name} not find in all declared variables."

