

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
	toJS: -> A

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
	@nil: -> Atom


Function

StandardFunction
	constructor: ({
		ways: Hash
	})
	evaluate

CustomFunction
	constructor: ([String] params, Expression body)
	evaluate



