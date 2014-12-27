{Molecule} = require "./Expressions/Molecule"
{Atom} = require "./Expressions/Atom"
{Root} = require "./Expressions/Root"
{Variable} = require "./Expressions/Variable"
{Nil} = require "./Expressions/Nil"
{Type} = require "./Type"
_ = require "lodash"



module.exports.Lexer =
class Lexer

	root: "Root"
	lexems: []
	errors: []

	constructor: (lexems) ->
		@errors = []
		@lexems = _.clone lexems, true
		@root = new Root null
		@root.init()

	###
	lexe: ->
		while @lexems.length > 0
			lexem = @lexems.shift()
			if lexem.value is "("
				@root.list.push @createMolecule @root
			else
				@root.list.push Type.infereFromLexem @root, lexem
		return @
	###

	out: ->
		@root


	# Delete the first lexem from the list and add id into the root
	# -> {Expression}
	###
	createMolecule: (parent) ->
		ret = new Molecule parent
		ret.init []

		while @lexems.length > 0
			lexem = @lexems.shift()
			if lexems.value is "'"
				q = new Quote parent
				q.init @createMolecule

			if lexem.value is "("
				exp = @createMolecule ret
				ret.list.push exp
			else if lexem.value is ")"
				return ret
			else
				atom = Type.infereFromLexem ret, lexem
				ret.list.push atom

		# TODO : improve this
		if ret.list.length is 0
			return new Nil parent
		return ret
	###

	lexe: ->
		while @lexems.length isnt 0
			@root.list.push @createExpression @root
		return @


	createExpression: (parent) ->
		#console.log "Lexer#createExpression"
		lexem = @lexems.shift()
		switch lexem.value
			when "("
				@createMolecule parent
			when "'"
				@createQuote parent
			when ","
				@createUnquote parent
			when ")"
				@errors.push "Error, wrong )."
				new Nil parent
			else
				Type.infereFromLexem parent, lexem


	createMolecule: (parent) ->
		#console.log "Lexer#createMolecule"
		ret = new Molecule parent
		ret.init []

		while @lexems.length isnt 0
			if @lexems[0].value is ")"
				@lexems.shift()
				return ret
			ret.list.push @createExpression ret

		return ret


	createQuote: (parent) ->
		ret = new Molecule parent
		q = new Variable(parent).init "quote"
		ret.init [q, @createExpression ret]
		return ret



	createUnquote: (parent) ->
		ret = new Molecule parent
		q = new Variable(parent).init "unquote"
		ret.init [q, @createExpression ret]
		return ret
