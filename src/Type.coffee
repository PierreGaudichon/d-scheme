{Atom} = require "./Expressions/Atom"
{Molecule} = require "./Expressions/Molecule"
{Variable} = require "./Expressions/Variable"
{Integer} = require "./Expressions/Integer"
{Real} = require "./Expressions/Real"
{reduce, isPlainObject} = require "lodash"


req = [
	"Atom",
	"Boolean",
	"CustomFunction",
	"Expression",
	"Integer",
	"Molecule",
	"Nil",
	"Pair",
	"Real",
	"Root",
	"SFunction",
	"StandardFunction",
	"Value",
	"Variable",
]


all = {}
for n in req
	all[n] = require("./Expressions/#{n}")[n]



module.exports.Type =
class Type

	@all: -> all

	@boolean:
		true: ["true", "#t", "#F", "True", "TRUE"]
		false: ["false", "#f", "#T", "False", "FALSE"]

	@tests:
		Integer: (s) -> /^\d+$/.test s
		Real: (s) -> /^\d+\.\d+$/.test s
		Boolean: (s) -> s in Type.boolean.true.concat Type.boolean.false
		Nil: (s) -> s in ["null", "nil"]
		Variable: (s) -> true

	@jsValues:
		Integer: (s) -> parseInt s, 10
		Real: (s) -> parseFloat s
		Boolean: (s) -> s in Type.boolean.true
		Null: (s) -> s
		Variable: (s) -> s

	@getConstructorName: (s) ->
		for name, test of Type.tests
			if test s
				return name


	# Compute the type of the variable from the given lexem
	# Lexem -> Atom (Value | Variable | Nil)
	@infereFromLexem: (parent, l) ->
		value = l.value
		constr = Type.getConstructorName value
		ret = new all[constr](parent)
		jsValue = Type.jsValues[constr] value
		ret.init jsValue
		#console.log ret.toJSON()
		return ret

	# Compute the atom representation from a type and a value
	# String, JsObject -> Expression (Atom)
	#@fromJS: (type, value) ->
	#	new all[type]()
	#	return new Atom type, value


	# Compute the JS value of the atom, based on it's type
	# Atom -> A
	#@toJS: (atom) ->
	#	atom.toJS()


	# Tell if the got type if an instance of expected type.
	# String, String -> Boolean
	# TODO : Molecule inside with plain object (see std/lambda l.6)

	@isInstanceof: (expected, got) ->
		#console.log "Type#isInstanceof"
		#console.log expected
		#console.log got
		if (isPlainObject expected)
			return (got instanceof Molecule)
		else if (got instanceof Molecule) or (got instanceof Variable)
			return true
		else if (got instanceof Real) and (expected instanceof Integer)
		else
			return (got instanceof expected)
