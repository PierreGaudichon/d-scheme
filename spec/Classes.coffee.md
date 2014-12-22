
Context
	addStd: (String name, Expression exp, P) -> void
	define: (String name, Expression exp, P) -> void
	push: ({name: Expression}) -> void
	pop: -> void
	getOne: (String name, P) -> Expression

CustomError
	constructor: (String runtime)
	log: (String msg, Object data) -> void
	allMessages: -> [String]

Interpreter
	constructor: ([Expression] tree)
	out: -> [Expression (Atom)]
	resolve: (P) -> Interpreter
	toString: -> String # TODO

Lexem
	constructor: (String value)
	setPosition: (Int number, {Int line, int column}) -> void

Lexer
	constructor: ([Lexem] lexems)
	create: -> Lexer
	out: -> [Expression]
	createMolecule: -> Expression (Molecule)

P
	constructor: (String runtime)
	getJS: ([Expression] expressions) -> [jsObjects]
	error: (String msg, data) -> void
	context: Context

Parser
	constructor: (String str)
	parse: -> Parser
	newChar: (String(length=1) char) -> Parser
	addToList: (String, {Int line, Int column}) -> void
	out: -> [Lexem]
	@test: -> Parser


StdManager
	constructor: ()
	feed: (String name, Hash req, P) -> void
	addConstand: (String name, {String type, JSObject value}, P) -> void
	addFunction: (String name, Hash ways, P) -> void
	folder: (StdManager manager, String path, P) -> void

Type
	@infereFromLexem: (Lexem) -> Atom
	@fromJS: (String type, JSObject value) -> Atom
	@toJS: (Atom) -> JSObject


Type
	@fromStd
	@Boolean | @String ...

Error
	send (blocking)
	tell (non blocking, warning)
