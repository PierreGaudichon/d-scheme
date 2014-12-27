module.exports.Parser =
class Parser

	str: ""

	env:
		string: false
		monoLineComment: false
		multiLinecomment: false
		escaped: false

	buffer: ""
	lexems: []

	position:
		line: 0
		column: 0
		number: 0

	@stringDelimiter: ["\""]
	@whitespace: [" ", "\t", "\n"]
	@lineBreaker: ["\n"]


	constructor: (@str) ->
		@lexems = []
		@buffer = ""

		# Reset position and environements
		for e, v of @env
			@env[v] = false
		for p, v of @position
			@position[v] = 0


	out: -> @lexems


	parse: ->
		for char in @str

			# Handle position
			if char in @lineBreaker
				@position.column++
				@position.line = 0
			else
				@position.line++



