{Atom} = require "./Expressions/Atom"
{reduce, isPlainObject} = require "lodash"


module.exports.Type =
class Type


	@types: [
		"Integer", "Real",
		"Boolean", "Null"
		#"String", "Char",
		"Variable",

	]

	@boolean:
		true: ["true", "#t", "#F", "True", "TRUE"]
		false: ["false", "#f", "#T", "False", "FALSE"]

	@tests:
		Integer: (s) -> /^\d+$/.test s
		Real: (s) -> /^\d+\.\d+$/.test s
		Boolean: (s) -> s in Type.boolean.true.concat Type.boolean.false
		Null: (s) -> s in ["null", "nil"]
		Variable: (s) -> true

	@jsValues:
		Integer: (s) -> parseInt s, 10
		Real: (s) -> parseFloat s
		Boolean: (s) -> s in Type.boolean.true
		Null: (s) -> s
		Variable: (s) -> s



	# Compute the type of the variable from the given lexem
	# Lexem -> Atom
	@infereFromLexem: (l) ->
		#new Atom "TODO", l.value
		value = l.value
		type = (type for type, test of Type.tests when test value)[0]
		jsValue = Type.jsValues[type] value
		return new Atom type, jsValue


	# Compute the atom representation from a type and a value
	# String, JsObject -> Expression (Atom)
	@fromJS: (type, value) ->
		return new Atom type, value


	# Compute the JS value of the atom, based on it's type
	# Atom -> A
	@toJS: (atom) ->
		throw new Error "TODO"


	# Tell if the got type if an instance of expected type.
	# Use inherance
	#	Expression
	# 		Atom
	# 			Boolean
	# String, String -> Boolean
	# TODO : Molecule inside with plain object (see std/lambda l.6)
	@isInstanceof: (expected, got) ->
		bools = [
			expected is got
			expected in ["Expression"]
			got in ["Molecule", "Expression"]
			got in Type.types and expected is "Atom"
			got is "Molecule" and isPlainObject expected
		]
		console.log {expected, got}
		console.log bools
		console.log reduce bools, (a, b) -> a or b
		return reduce bools, (a, b) -> a or b
