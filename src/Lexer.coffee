{Molecule} = require "./Expressions/Molecule"
{Type} = require "./Type"


module.exports.lexe = (list) ->
	new Lexer(list).create().out()

module.exports.Lexer =
class Lexer

	tree: []
	lexems: []

	constructor: (@lexems) ->
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
				return new Molecule ret
			else
				atom = Type.infereFromLexem lexem
				ret.push atom

		console.log "not touch"


###

(* (+ 2 4) (- 1 2))
s = []
t = []



###
