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


	each: (fun) ->
		for fold, content of @all
			for name, req of content
				fun name, req



	# Add an Atom from Std by
	# - it's name
	# - the function or object stored in the file.
	# - the programm, where the context is.
	addToContext: (root) ->
		feeding = _.extend Type.all(), {EkE}
		@each (name, req) =>
			ways = req.ways
			if _.isFunction ways
				@addFunction name, ways(feeding), root
			else if ways.type? and ways.value?
				@addConstant name, ways, root
			else
				P.error "std file"


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







