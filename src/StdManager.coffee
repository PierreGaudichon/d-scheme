_ = require "lodash"

{Expression} = require "./Expressions/Expression"
{StandardFunction} = require "./Expressions/StandardFunction"
{Boolean} = require "./Expressions/Boolean"
{Real} = require "./Expressions/Real"
{Nil} = require "./Expressions/Nil"
{Type} = require "./Type"

{std} = require "./metaExec"


# Define a function from E^k to E
# E is type
# see src/std/+.coffee
EkE = (name, type, fun) ->
	r = {}
	r["(#{name} a b ...)"] =
		parameters:
			"...": type
		return: type
		resolve: true

		fun: (ret, args, P) ->
			jsArgs = P.getJS args
			ret.init _.reduce jsArgs, fun
	return r


# Define a function from E to E
# E is a type
# Use for cos, sin, sqrt, ...
EtE = (name, fun) ->
	r = {}
	r["(#{name} x)"] =
		parameters:
			0: Real
		return: Real
		resolve: true

		fun: (ret, [a], P) ->
			ret.init fun a.toJS()
	return r

# Define a function which test if an expressio n is a `type`.
# Use for char?, string?, integer? ...
isType = (name, type) ->
	r = {}
	r["(#{name} expression)"] =
		parameters:
			0: Expression
		return: Boolean
		resolve: true

		fun: (ret, [a], P) ->
			ret.init (a instanceof type) or (a instanceof Nil)
	return r


module.exports.StdManager =
class StdManager

	all: {}


	constructor: ->
		@all = {}


	# Add all the content of the files under the `path`
	# Hash -> void
	folder: (dir, hash) ->
		feeding = _.extend Type.all(), {EkE, EtE, isType}
		fold = {}
		for name, req of hash
			name = req.name if req.name?
			req.name = name
			req.ways = req.ways feeding
			if name[0] isnt "_"
				fold[name] = req
		@all[dir] = fold
		return @


	std: ->
		@folder "std", std


	each: (fun) ->
		for fold, content of @all
			for name, req of content
				name = req.name if req.name?
				fun name, req



	# Add an Atom from Std by
	# - it's name
	# - the function or object stored in the file.
	# - the programm, where the context is.
	addToContext: (root) ->
		@each (name, req) =>
			if req.ways.type? and req.ways.value?
				@addConstant name, req, root
			else
				@addFunction name, req, root


	# Add a constant, the file return a {type, value}.
	addConstant: (name, {ways: {type, value}}, root) ->
		atom = new type(root)
		atom.init value
		root.define name, atom


	# Add a function, the file return
	# {way: {parameter, return, fun(args, P)}}
	addFunction: (name, {special, ways}, root) ->
		f = new StandardFunction(root)
		f.init name, ways
		if special?
			f.special special
			root.define ("std-special-namespace-" + name), f
		else
			root.define name, f
