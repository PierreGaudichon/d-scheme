{Molecule} = require "./Expressions/Molecule"
{Atom} = require "./Expressions/Atom"
{Root} = require "./Expressions/Root"
{Type} = require "./Type"
_ = require "lodash"



module.exports.Lexer =
class Lexer

	root: "Root"
	lexems: []

	constructor: (lexems) ->
		@lexems = _.clone lexems, true
		@root = new Root null
		@root.init()


	lexe: ->
		while @lexems.length > 0
			if @lexems.shift().value is "("
				@root.list.push @createMolecule @root
		return @

	out: ->
		@root


	# Delete the first lexem from the list and add id into the root
	# -> {Expression}
	createMolecule: (parent) ->
		ret = new Molecule parent
		ret.init []

		while @lexems.length > 0
			lexem = @lexems.shift()
			if lexem.value is "("
				exp = @createMolecule ret
				ret.list.push exp
			else if lexem.value is ")"
				if ret.list.length is 0
					return new Nil parent
				return ret
			else
				atom = Type.infereFromLexem ret, lexem
				ret.list.push atom

		throw new Error "Not supposed to be touched."
