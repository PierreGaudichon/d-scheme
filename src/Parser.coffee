

class Parser

	string: ""
	list: []


	constructor: (str) ->
		@feed str


	feed: (str) ->
		@string = str
		@list = []


	parse: ->


	addToList: (value, position) ->
		lexem = new Lexem value
		number = @list.length
		lexem.setPosition number, position
		@list.push lexem
		null


	out: ->
		@list


	@test: ->
		parser = new Parser "(+ 4 2)"
		parser.addToList "("
		parser.addToList "+"
		parser.addToList "4"
		parser.addToList "2"
		parser.addToList ")"
		return parser
