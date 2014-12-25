glob = require "glob"
{basename, join, dirname, relative} = require "path"
_ = require "lodash"

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
		resolve: true

		fun: (ret, args, P) ->
			jsArgs = P.getJS args
			ret.init _.reduce jsArgs, fun
	return r




module.exports.StdManager =
class StdManager

	all: {}


	constructor: ->
		@all = {}

	# Add all the content of the files under the `path`
	# String -> void
	folder: (path) ->
		feeding = _.extend Type.all(), {EkE}
		files = glob.sync path
		dir = dirname path
		fold = {}
		if @all[dir]?
			throw new Error "TODO"
		_ files
			.map (f) -> relative "/", f
			.map (f) -> join "/", dirname(f), basename(f, ".js")
			.map (f) ->
				name = basename f
				req = require f
				if _.isFunction req.ways
					req.ways = req.ways feeding
				if name[0] isnt "_"
					fold[name] = req
		@all[dir] = fold
		return @


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
				@addConstant name, req.ways, root
			else
				@addFunction name, req.ways, root

	# Add a constant, the file return a {type, value}.
	addConstant: (name, {type, value}, root) ->
		#console.log Type.all()[type]
		constr = Type.all()[type]
		atom = new constr(root)
		atom.init value
		root.define name, atom


	# Add a function, the file return
	# {way: {parameter, return, fun(args, P)}}
	addFunction: (name, ways, root) ->
		f = new StandardFunction(root)
		f.init name, ways
		root.define name, f


	test: ->
		@each (name, req) =>


	generateDoc: ->







