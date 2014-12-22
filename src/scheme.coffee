{Parser} = require "./Parser"
{Lexer} = require "./Lexer"
{Interpreter} = require "./Interpreter"
{StdManager} = require "./StdManager"


module.exports.compute = (str) ->
	parser = new Parser(str)
	list = parser.parse().out()

	lexer = new Lexer(list)
	tree = lexer.create().out()

	interpreter = new Interpreter(tree)
	manager = new StdManager
	manager.folder "bin/std/*"
	manager.addToContext interpreter.P
	end = interpreter.resolve().toString()

	if interpreter.P.errors.allMessages().length > 0
		return interpreter.P.errors.allMessages().join "\n"

	return end
