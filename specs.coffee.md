

Expression
	Molecule
	Atom
	Function
		StandardFunction
		CustomFunction

Expression
	resolve: (P) -> Expression
	evaluate: ([Expression], P) -> Expression
	toString: -> String

Molecule
	constructor: ([Expression] list)
	resolve
	evaluate
	toString

Atom
	constructor: (String type = "A", (A) value)
	evaluate
	resolve
	toString


Function

StandardFunction
	constructor: ({
		parameters [String],
		return String
		fun: Function
	})
	evaluate

CustomFunction
	constructor: ([String] params, Expression body)
	evaluate


P
	context: Context
	errors: Error
	getJS: ([Expressions]) -> jsValue | error


Context
	push: ({name: Expression}) -> void
	pop: -> void
	getOne: (String name, P) -> Expression

	constructor: ->
	addStd: (Hash d, P) -> void
	define: (String name, Expression) -> void



Type
	@fromStd
	@Boolean | @String ...

Error
	send (blocking)
	tell (non blocking, warning)
