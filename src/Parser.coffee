{Lexem} = require "./Lexem"


module.exports.parse = (str) ->
	new Parser(str).parse().out()


module.exports.Parser =
class Parser

	string: ""
	list: []

	buffer: ""
	position:
		line: 0
		column: 0


	@white: [" ", "\t", "\n"]
	@lexemBreaker: ["(", ")"]
	@lineBreaker: ["\n"]
	#@stringDelimiter: ["\"", "\'"]


	# String -> Parser
	constructor: (str) ->
		@string = str
		@list = []
		@position = {line: 0, column: 0}
		@buffer = ""


	# -> Parser
	parse: ->
		for char in @string
			if char in Parser.lexemBreaker
				@newLexem()
				@buffer += char
				@newLexem()
			else if char not in Parser.white
				@buffer += char
			else
				@newLexem()
			@newChar char
		return @


	# String (length=1) -> Parser
	newChar: (c) ->
		@position.char++

		if c in Parser.lineBreaker
			@position.line++
			@position.column = 0

		return @

	# -> void
	newLexem: ->
		if @buffer.length > 0
			@addToList @buffer, @position
		@buffer = ""

	# string, {int line, int column} -> void
	addToList: (value, position) ->
		lexem = new Lexem value
		number = @list.length
		lexem.setPosition number, position
		@list.push lexem
		null

	# -> [Lexem]
	out: ->
		@list


	# -> Parser
	@test: ->
		parser = new Parser "(+ 4 2)"
		parser.addToList "("
		parser.addToList "+"
		parser.addToList "4"
		parser.addToList "2"
		parser.addToList ")"
		return parser
