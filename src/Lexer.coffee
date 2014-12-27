{Molecule} = require "./Expressions/Molecule"
{Atom} = require "./Expressions/Atom"
{Root} = require "./Expressions/Root"
{Nil} = require "./Expressions/Nil"
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
			lexem = @lexems.shift()
			if lexem.value is "("
				@root.list.push @createMolecule @root
			else
				@root.list.push Type.infereFromLexem @root, lexem
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
				#if ret.list.length is 0
				#	return new Nil parent
				return ret
			else
				atom = Type.infereFromLexem ret, lexem
				ret.list.push atom

		# TODO : improve this
		if ret.list.length is 0
			return new Nil parent
		return ret
