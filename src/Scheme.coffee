{clone, isEqual} = require "lodash"
{Parser} = require "./Parser"
{Lexer} = require "./Lexer"
{Interpreter} = require "./Interpreter"
{StdManager} = require "./StdManager"



module.exports.Scheme =
class Scheme

	manager: "StdManager"
	str: ""
	lexems: []
	root: "Root"
	computed: "Root"
	tests: []


	constructor: ->
		@manager = new StdManager
		@str = null
		@lexems = null
		@root = null
		@computed = null
		@tests = []


	in: (type, value) ->
		@[type] = value
		return @


	out: (type, {format}) ->
		o = @[type]
		if format is "json"
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
			else
				return o.toString()



	std: (path) ->
		@manager.folder path
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


