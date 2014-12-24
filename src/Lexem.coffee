
module.exports.Lexem =
class Lexem

	position:
		number: 0
		lineStart: 0
		lineEnd: 0
		columnStart: 0
		columnEnd: 0
	value: ""

	# Whatever -> Lexem
	constructor: (@value) ->

	# int, {int, int} -> void
	setPosition: (number, {line, column}) ->

	toJSON: -> {class: "Lexem", @value}
