{isEqual} = require "lodash"
{Parser} = require "./Parser"
{Lexer} = require "./Lexer"
{Interpreter} = require "./Interpreter"
{StdManager} = require "./StdManager"
{reporter} = require "./reporter"



module.exports.Scheme =
class Scheme

	manager: "StdManager"
	str: ""
	lexems: []
	root: "Root"
	computed: "Root"
	tests: []
	documentation: []
	sheet: []


	constructor: ->
		@manager = new StdManager
		@str = null
		@lexems = null
		@root = null
		@computed = null
		@tests = []
		@documentation = []

	in: (type, value) ->
		@[type] = value
		return @


	out: (type, {format}) ->
		o = @[type]
		if format is "json"
			if type is "lexems"
				return (i.toJSON() for i in o)
			return o.toJSON()
		else if format is "raw"
			return o
		else if format is "str"
			if type is "tests"
				ret = []
				for {name, test, exports, got, ok} in @tests
					check = if ok then "ok" else "!"
					ret.push "(#{check}) Scheme#test => #{name} : #{test}"
				return ret
			return o.toString()
		else if format is "md"
			if type is "documentation"
				return reporter.documentation o
			if type is "cheatsheet"
				o = @documentation
				return reporter.cheatsheet o
			return o.toString()



	std: (path) ->
		@manager.std()
		return @


	parse: ->
		@lexems = new Parser(@str).parse().out() if @str?
		return @


	lexe: ->
		@root = new Lexer(@lexems).lexe().out() if @lexems?
		return @


	interprete: ->
		@manager.addToContext @root
		@computed = new Interpreter(@root).resolve().out()
		return @


	test: ->
		@manager.each (name, req) =>

			for test, result of req.test
				computed = @in("str", test)
					.parse()
					.lexe()
					.interprete()
					.out "computed", format: "str"
				@tests.push
					name: name
					test: test
					expected: result,
					got: computed,
					ok: isEqual result, computed
		return @


	doc: ->
		@manager.each (name, req) =>
			req.name = name
			@documentation.push req
		return @
