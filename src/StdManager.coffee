glob = require "glob"
{basename, join, dirname, relative} = require "path"
_ = require "lodash"

{Atom} = require "./Expressions/Atom"
{CustomFunction} = require "./Expressions/CustomFunction"
{Expression} = require "./Expressions/Expression"
{Function} = require "./Expressions/Function"
{Molecule} = require "./Expressions/Molecule"
{StandardFunction} = require "./Expressions/StandardFunction"

{Type} = require "./Type"


# Define a function from E^k to E
# E is type
# see src/std/+.coffee
EkE = (name, type, fun) ->
	r = {}
	r["(#{name} a b ...)"] =
		parameters:
			"...": type
		return: type

		fun: (args, P) ->
			jsArgs = P.getJS args
			_.reduce jsArgs, fun
	return r


feeding = {
	Expression, Function
	CustomFunction, StandardFunction,
	Atom, Molecule
	Type
	EkE
}


module.exports.StdManager =
class StdManager

	all: {}


	constructor: ->
		@all = {}


	# Add an Atom from Std by
	# - it's name
	# - the function or object stored in the file.
	# - the programm, where the context is.
	feed: (name, ways, P) ->
		if _.isFunction ways
			@addFunction name, ways(feeding), P
		else if ways.type? and ways.value?
			@addConstant name, ways, P
		else
			P.error "std file"


	addToContext: (P) ->
		for fold, content of @all
			for name, req of content
				@feed name, req.ways, P


	test: ->

	generateDoc: ->



	# Add a constant, the file return a {type, value}.
	addConstant: (name, {type, value}, P) ->
		P.context.addStd name, Type.fromJS type, value


	# Add a function, the file return
	# {way: {parameter, return, fun(args, P)}}
	addFunction: (name, ways, P) ->
		P.context.addStd name, new StandardFunction ways


	folder: (path) ->
		files = glob.sync path
		dir = dirname path
		fold = {}
		if @all[dir]?
			throw new Error "TODO"
		_ files
			.map (f) -> relative "/", f
			.map (f) -> join "/", dirname(f), basename(f, ".js")
			.map (f) ->
				fold[basename f] = require f
		@all[dir] = fold
		return @
