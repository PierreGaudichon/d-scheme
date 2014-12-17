{Atom} = require "./Expressions/Atom"

module.exports.Type =
class Type


	@types: [
		"Variable"
		"Integer", "Real",
		"Boolean"
	]

	@boolean:
		true: ["true", "#t", "#F", "True", "TRUE"]
		false: ["false", "#f", "#T", "False", "FALSE"]




	# Compute the type of the variable from the given lexem
	# Lexem -> Atom
	@infereFromLexem: (l) ->
		new Atom "TODO", l.value

	# Compute the JS value of the atom, based on it's type
	# Atom -> A
	@toJS: (atom) ->
