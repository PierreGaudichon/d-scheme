Expression
	Root
	Atom
		SFunction
			Standart
			Custom
		Variable
		Value
			Boolean
			Integer
			Real
		Pair
		Nil
	Molecule

Expression
	constructor
	init
	resolve
	evaluate
	toString
	toJS
	toJSON
	attach
	define
	getVariable

Expression
	context: {String name: Expression value}
	parent: Expression
	constructor: (Expression parent) -> @
	init: (Expression v) -> Expression
	attach: ({String name: Expression value}) -> @
	define: (String name, Expression value) -> @
	getVariable: (String name, P) -> Expression

Root
	list: []
	init: -> @
	define: ({String name: Expression value}) -> @
	getVariable(String name, P) -> Expression
	resolve: (P) -> Root
	toString
	toJSON

Atom
	TODO @create: (String | Class type, js value) -> Atom

SFunction
	resolve: -> @
	toString

StandardFunction
	ways: Hash
	name: String
	isSpecial: Boolean
	specialRegex: Regex
	specialName: String
	init: (String name, Hash ways) -> @
	special: (Regex) -> @
	evaluate: ([Expression] args, P) -> Expression
	toJSON

CustomFunction
	params: [String]
	body: Expression
	init: ([String] params, Expression body) -> @
	evaluate: ([Expression] args, P) -> Expression
	toJSON

Variable
	name: String
	init: (String name) -> @
	resolve: (P) -> Expression
	toString
	toJSON

Value
	type: String
	value: js
	init: (js value) -> @
	resolve: -> @
	toJS: -> js
	toString
	toJSON

Real
	init: (js value) -> @

Pair
	left: Expression
	right Expression
	init: (Expression left, Expression right) -> @
	resolve: -> @
	toString

Nil
	init: -> @
	resolve: -> @
	toJS: -> null
	toString
	toJSON

Molecule
	list: [Expression]
	init: ([Expression] list) -> @
	resolve: (P) -> Expression
	toString
	toJSON
