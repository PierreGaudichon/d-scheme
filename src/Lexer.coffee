{Molecule} = require "./Expressions/Molecule"
{Atom} = require "./Expressions/Atom"
{Type} = require "./Type"
_ = require "lodash"


module.exports.lexe = (list) ->
	new Lexer(list).create().out()

module.exports.Lexer =
class Lexer

	tree: []
	lexems: []

	constructor: (lexems) ->
		@lexems = _.clone lexems, true
		@tree = []


	create: ->
		while @lexems.length > 0
			if @lexems.shift().value is "("
				@tree.push @createMolecule()
		return @

	out: ->
		@tree


	# Delete the first lexem from the list and add id into the tree
	# -> {Expression}
	createMolecule: ->
		ret = []

		while @lexems.length > 0
			lexem = @lexems.shift()
			if lexem.value is "("
				exp = @createMolecule()
				ret.push exp
			else if lexem.value is ")"
				if ret.length is 0
					return Atom.nil()
				return new Molecule ret
			else
				atom = Type.infereFromLexem lexem
				ret.push atom

		throw new Error "Not supposed th be touched."
