{P: Pklass} = require "./P"


module.exports.Interpreter=
class Interpreter

	@root: []
	@values: []

	# Creates the interpreter with some Expressions
	# Root -> Interpreter
	constructor: (root) ->
		@root = root
		@P = new Pklass "interprete"


	# Return the values interpreted.
	# -> [Expression]
	out: -> @root

	# Resolve all the tree.
	resolve: ->
		@root = @root.resolve @P
		#@root.attach @context
		return @

	toString: ->
		@root.toString()

	define: (name, value) ->
		@root.define name, value




