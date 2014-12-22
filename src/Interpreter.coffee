{P: Pklass} = require "./P"

module.exports.interprete = (tree, P) ->
	new Interpreter(tree).resolve().out()


module.exports.Interpreter=
class Interpreter

	@tree: []
	@values: []

	# Creates the interpreter with some Expressions
	# [Expression] -> Interpreter
	constructor: (tree) ->
		@tree = tree
		@values = []
		@P = new Pklass "interprete"


	# Return the values interpreted.
	# -> [Expression]
	out: -> @values

	# Resolve all the tree.
	resolve: ->
		for exp in @tree
			@values.push exp.resolve @P
		return @

	toString: ->
		#console.log @values
		(v.toString() for v in @values).join " ; "
