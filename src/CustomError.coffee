_ = require "lodash"



# The class to log all error. Used in parser, lexer and interpreter.
#
module.exports.CustomError =
class CustomError


	# the differents runtimes whit their errors
	@runtimes:
		parse:
			"0": 0
		lexe:
			"0": 0
		interprete:
			"not a function": "Not a function."
			"already std": "The Atom already exists in the Std variables."
			"already global": "The Atom already exist in the defined variables."
			"not found in variables": "The requested variable cannot be found in the context."
			"std file": "The std file is wrongly formatted."
			"not function": "Try to evaluate a non function value."
			"wrong arguments": "The function was called with wrong arguments."

	# The runtime we are in.
	runtime: ""

	# All errors, contains {runtime, date, message, data}
	all: []


	# Creates the Error
	#
	# @param r [String] the runtime
	constructor: (r) ->
		@runtime = r
		@all = []


	# Log an error, dont block the programm, but others errors will follow.
	#
	# @param msg [String] the shots message, as defined in @runtimes
	# @param data [Object], some data for errors.
	log: (msg, data) ->
		message = CustomError.runtimes[@runtime][msg]
		unless message?
			message = "Error with no description : #{msg}"

		@all.push
			runtime: @runtime
			message: message
			date: new Date()
			data: data

	# Return all errors message in an array
	allMessages: ->
		(a.message for a in @all)


